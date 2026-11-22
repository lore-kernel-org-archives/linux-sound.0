Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341833;
	b=efVk1WjGd4lFzKqvnUEXLLsGlVIWRxWdFVR8VcabctfflMACOJVsjJ0gSwZJgybD+mjR
	 iNLpKqoS3l0yA37tNr1jRGEPnycCwq1gPBskeaGIJudVh8/pf9aQ+XqFhRBxEWc8buA/L
	 DWanEfStIyFKGjESRmsNBRkDbo0qwx+yv1igwhpjdcnb+jp88CmYmp/JvajglrISF/oTh
	 RfO0UUnVSeMj6EwDTlMVI/heZN9O1Uy5xI7037C3BW1ErHD+JbZP4579CilJvVOWaj8hb
	 9Bv7FjcEP1Z4CDDbDVw0XgXb9/zjss2dgZGRpWkSVU6uduLe7+nNFkkNpu7+1o0fpow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
	b=R5WP67yWl/blr9/cyp4feBEmSdG2f7YGhQXglgCkBMXuYR9/Fns2G62v6WqoIPU6M72D
	 eX2EN8QiHZdtHawmGWR9CLY3JA4MMZsTqx38QQy20Imrh6tYa590B5rL62otaQlKb+thW
	 2ZBasvo8XcRJpKTcwMz7NH7xY+s3zKTkw3eI1tDaYozy+uVO70ZfOkyuj24qcmnB5/bhD
	 9O1WLGghT0JNvMyLaZNIPpZZGLFFHRYXS9UeI8XnR8ZwPzTOPjHQzGnw1jrN/IBICzmsW
	 fizJA/VYuPKFH8kS8J1XtCI2lENAC9S+rjfX5WIlYDhfiWiPCIaDAepnJ1dSi+ScewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE5606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AE5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso2774051fa.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 02:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341831; x=1795946631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=qRMIX9Fse1q9rgE+hsN3rqYn28MkIBOjp9Z1P3GlJ19eu6CSdU3bVhVg+riMplID2T
         MsrzKHjY9yAuyeunBzQ0iuNLRKSre/z6fBX1yifAL/HhgIR1cY7a6bt9IU9jrblmZdXa
         jTOAXe+Xnq+myUzRIx0cehqNFRZBS9Fkb7kZwuSaBLcWqUBuuO1oT45RdJlnhg4gPNvL
         V0PTHgEYpK7sTjiLPa9zpxf1e0v0EvE9zeQUrTaBOMPArIe7mIOJYYOPgcDvUtD5old+
         jv9fkGTv5TLsrGx3eXDM34K35gy7GFnlTJjfQwv4Rcv+Qw0dj2avsHWLDIMEuEMBEbhX
         eGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341831; x=1795946631;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=NwxiiRP5s4JnDA6ePEzsJh27p9OXapxFBjlV/astljuyDyLScvquDetC+e5VUwGyMI
         jtASICSpusAiY+P3dOpS8eZo5e/037hwJ9Jg6ZdkR+q3l5SMEO8JZdSNUd/cShEQLQXQ
         hfT/Qab9lKmXZY90mXkny6FYZlFI2tsy6aiAYkKYFpe2y3UQAK20D4/eARUPgCjZGqhd
         AxWhIP2xRSKjXGwzC784SWtxHnl1bBQCMw9st/ctn1ngLihZ1iP/4tjw6OeaJmFQpRVh
         UWIaSXO+2lnVOGt8SIW9qK36175eqnd4wDrXmRufwIdp5F1EfHzpR+Me+nAH1ZuXBgkc
         +45A==
X-Forwarded-Encrypted: i=1; AL+hErHgkvoWeHhYdZSKTUL8XiW0Xa01EGetqg9yMy3hqTsfvhMzzyLAiEaJOI6iCZfOrahtDBqgtsiP7T64PA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Us+Cem5GCp0p1Jz9bKOZMxSdB27RQPxXinLjoYbpE9bMtC4N6
	mAOEqVUtU3Yl1F23UnLeHeIb/siGFCR29NmQZYMTmgio6h9rJK1fRoH1c5ONBm9+A09dhw==
X-Gm-Gg: AZFdTZcnqwJgXKsXTMgPZM+ol6Hv/3Wq+yQmEH3zUFaDYANodLcpyTcyhebDBrbpwFk
	RURl+wm3PPZh0t+4NFIGjOtnYzQjhsjYh6tdpficdiyeX2vXNsYLpIu6WUTbnRsu4W/HzsXhL0k
	kTVzwVDXB/VgB8yqWcSqm3FO3On/0jR2ld9AR1X4Ke84E/qtoZWwOzg2cohalsjkmwoCyEkMkI0
	fSGFDlcKMZ+DybclznvHgV1N1al8AFkiv7ji5GO7Dv3eJNdccr5nfglFoxrxR8ESrmNiLQ7zXdB
	iGGpahPr7eb6esAMqBHpY8U/lvQIKEhTt3dPBBTvecAJnJ+exqxgXafh/rqaMY2XIeNpZNJrhKr
	ZQ/LhLRSlslnE+RGyTmdDLeOZn3P5GOuuijQRKwiEorLtWXRBmGcViHKXFnBws2ItmQisJ/MWOY
	LsWUU8iC4czgtIxSR8e/yXTMSXyp6ecxegI4jmO3ZA49+9uhdX1AA+86y7SeybMFxrd0uXayyLf
	daf3G6u1a95PDCOL/Gb0W7q2eu6elzA+WTgnFXpvgLe9PrTQFSt9dDvBH+EcdHPEZlZttqSw50s
	KwKGmOiSUFrZJ2K5JNKoHdnZHKuW5S9LjLjYfqtSiICQojAUCkupM7eDaYNH+68rjJYeQpGaZO1
	nybpWlELbKXGiPGrgnXuZKpqXmed2NojACmkdJp1Q
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr2679661e87.2.1795341830712;
        Sun, 22 Nov 2026 02:03:50 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee97csm23390751fa.13.2026.11.22.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:03:49 -0800 (PST)
Date: Sun, 22 Nov 2026 12:03:48 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO controllers
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Message-ID: <20261122-swrm-mmio-irq-ping-f2926d22952d@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vinod,

A gentle ping on this one. It fixes a regression from b27be5a85ed3,
which is in v7.4-rc1, so it would be good to have it in the fixes
for 7.4.

Thanks,
Ivan
