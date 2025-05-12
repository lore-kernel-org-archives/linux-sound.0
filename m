Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D83B25C828
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043348; cv=none; b=ZzUvmFiYqp5Q/as1F1zBpe4CLQktx38osDe9gYL6RNNJMLaFYl+5v7hnH/HLuBIIQMgLdFVPCXvFIZd2wHr/NFoCp1gYxgTGuT5V1oPBXwRks8Sfu9TwS4L2goB37XrWG21Myh2bzjlLm2R0OjHLtdKvRCId3Si5CUKKUyOzBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043348; c=relaxed/simple;
	bh=FjxYPLlr7Uq9cM7LdYkKNRb9rcPcU4sZk2VzpdUBREE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=bg2XhB0TxlLpM/LtJUTxg0Nd6wBY2SRzXZ2A2o1DuFXmfobGgJJTjH0dN8/79PSrWgB4yWCqIjOOCknqHqqjFy3xOlyotUJ2utAWa6hnrCCBylVkR/RNuhNc3aDjSnTsvBxFFuTqVlRZm/0tYzVP1/Ytr9mFwc0dtzEMvXXh3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rppzsi7Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rppzsi7Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so28337835e9.0
        for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747043345; x=1747648145; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6vKiFjkGAusVaPlO8lPwTMhUgkuRZjj25b8eYWh0l0=;
        b=Rppzsi7ZSJFG25s+ojwcubUtlGz9feOsa4xjEX+5jiWYoR988m1L+ol8Mn9pUbCw0r
         5ZLW+lu5HviAywS1e/HbJJRTw3ZwaU1RwUONm0D8xU/7eBwucGM9BLD+TGMQKX6ndbHK
         X/NNuAoo1SnB2cZrigcH0iiW0cJKH2rbluyVabiQDTw71y7dai7QbhYTtWoeHOCP0bRv
         OqOUXt8SmJjnuYvUqYByD885ksQS9XCYvuQUc+n9jdJKIH56BHKL7dx0ZRmNmw5JoQU8
         ajJrzkbcILMDVy24j3ELfJdS/N273sMDKSQT+rj8ler7+7vomotW0qBR/CxxNNYywEln
         0qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043345; x=1747648145;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l6vKiFjkGAusVaPlO8lPwTMhUgkuRZjj25b8eYWh0l0=;
        b=PRnvBdjQI10fRQpIko8Pd+cNLRyvH+aBuK5Cwd2ME3rjQrq6rHvJ/aIeghfe+xG8u2
         4YBtsya0Dc73mvQNWBygMEM1HESHuEkDxAMN4cLHCQR5mh/1xrJM8Z8pKaMl4JKRXYv8
         ss2jW3W2pdlet1fh37URM92odZaKRE/Bwl5q2lqsdItoEy3A0k5FZDBJ1Fyg1KnsUJMu
         VXzWc4Niom6Vi1mvHcBdhhZzYHk+Uk6TwSLfs0l5I3cQ6ujsiDn0HZF5EannD8pJhIzA
         R8otWTIQjx7EiAO23YHR0M77IDYQ8P09R7fdCs2IVlJMAlLzlDLdYuZ6sVTRY/DBzHzV
         Xx8w==
X-Gm-Message-State: AOJu0Yx0zFb5mYtuPQnJPwkZqWCTqBDlTmy4g38SYEDTmeC/tMcF1coI
	91qeil1C3nuGIC3KCVxLXK5X38vC2tkLpCHrOSME3KunL5CSOCKLW9ta5H9m
X-Gm-Gg: ASbGncv62XBLXv+iYrMuZWTdKCE8h1zh6qfn+kn/NCKRzYfboY/DTC7QF1wLKc7Da40
	/KTye1ZePONUYjtzquvQDODom6kn5AKr6LZqAyi24aXDeC602z1/IonaZHlqzRXXwmqA+RTVLj2
	hNPxFAIKBdO6Dz7woifaJBWWt3kUuCNx9GBTB8x+2qMg1kewdkpuuIMEBbTqf81heFRd35b5VZs
	KLw1RlC0wKCLmW5ro0DPyoGPW7ugEHwkeW4HPONj8k8geuFSr+3Ukt4CN+jmI2p8IMQUQ5jZHJn
	v0rMdJuuZkKhjA9EEqFd41PppQ6TtayK3pOiXxy+zdEH0h5BjahRMsHIA5xlmW2xs7Yx
X-Google-Smtp-Source: AGHT+IGfMosdYk21nM4JLc7yD1R4Zm/LhT3gEDlS9pqvMRbe9NvqBwEIyIRWJnMlElQg84necrWZSw==
X-Received: by 2002:a05:600c:350e:b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-442e9ebcc41mr428275e9.26.1747043344835;
        Mon, 12 May 2025 02:49:04 -0700 (PDT)
Received: from [192.168.223.119] ([178.240.186.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328535sm166022335e9.4.2025.05.12.02.49.02
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:49:04 -0700 (PDT)
Message-ID: <f34999d9-5594-4f69-9dab-de282cd401cd@gmail.com>
Date: Mon, 12 May 2025 12:49:01 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?B?QWxpIEZ1YXQgUGHFn2FsxLFvxJ9sdQ==?= <afuatpasalioglu@gmail.com>
Subject: Internal Microphone Not Working on Lenovo Yoga Slim 7 Pro with Linux
 Mint 22.1
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux Mint Support Team,

I am a passionate and grateful new user of Linux Mint. I recently 
switched from Windows and have been enjoying the system stability and 
user-friendly experience. As a newcomer to Linux, I manage to handle 
many tasks with the help of the terminal and ChatGPT.

However, I am facing a persistent issue that has significantly affected 
my workflow:

 > My internal microphone is not working on my Lenovo Yoga Slim 7 Pro 
(AMD Ryzen 5 6600HS + Realtek ALC257 codec).



Note: Not long ago, I was able to use this same internal microphone 
under Linux Mint on this very laptop, including in Zoom-like 
applications. This suggests that either a kernel, driver, or PipeWire 
update might have broken support recently.

I have tested multiple approaches, including:

Switching between PulseAudio and PipeWire

Modifying /etc/modprobe.d/alsa-base.conf with various model parameters:

model=lenovo

model=ideapad

model=dual-codecs

model=auto


Verifying with alsamixer that Mic ACP LED remains off (disabled)

Using pavucontrol, but the input device shows as "Microphone (unplugged)"


The microphone works perfectly under Windows.

Due to this limitation, I am forced to carry and use an external USB 
microphone during my online meetings. While this workaround helps, it’s 
inconvenient, and I hope this issue can be resolved at the 
driver/firmware/kernel level for AMD + Realtek-based laptops like mine.

System Details:

Distro: Linux Mint 22.1 Xia (based on Ubuntu 24.04 Noble)

Kernel: 6.8.0-59-generic

Desktop: Cinnamon 6.4.8 (Muffin 6.4.1)

Laptop: Lenovo Yoga Slim 7 Pro 14ARH7

CPU: AMD Ryzen 5 6600HS Creator Edition

Audio Codec: Realtek ALC257 (with ACP/ACP6x support)

Sound backends tested: PulseAudio, PipeWire

Audio devices detected:

AMD Rembrandt HD Audio (snd_hda_intel)

AMD ACP/ACP6x Audio Coprocessor (snd_pci_acp6x)

AMD Family 17h/19h HD Audio (snd_hda_intel)


Current workaround: BOYA M1 via USB-C DAC (recognized as USB Audio)


Please consider improving support for this hardware combination. I 
really love Linux Mint and want to stick with it long-term.

Thank you for your work!

Best regards, Ali Fuat

