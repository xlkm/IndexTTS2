"""
音频处理工具函数
"""

import librosa
import soundfile as sf
import numpy as np


def load_audio(file_path, sr=22050):
    """
    加载音频文件
    
    Args:
        file_path: 音频文件路径
        sr: 目标采样率
    
    Returns:
        audio: 音频数组
        sr: 采样率
    """
    audio, sr = librosa.load(file_path, sr=sr)
    return audio, sr


def save_audio(audio, file_path, sr=22050):
    """
    保存音频文件
    
    Args:
        audio: 音频数组
        file_path: 保存路径
        sr: 采样率
    """
    sf.write(file_path, audio, sr)


def normalize_audio(audio):
    """
    标准化音频
    
    Args:
        audio: 音频数组
    
    Returns:
        标准化后的音频
    """
    return librosa.util.normalize(audio)


def extract_mel_spectrogram(audio, sr=22050, n_mels=80):
    """
    提取梅尔频谱图
    
    Args:
        audio: 音频数组
        sr: 采样率
        n_mels: 梅尔滤波器数量
    
    Returns:
        梅尔频谱图
    """
    mel = librosa.feature.melspectrogram(
        y=audio, 
        sr=sr, 
        n_mels=n_mels
    )
    return librosa.power_to_db(mel, ref=np.max)
