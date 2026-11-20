Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218408;
	b=DJaOFj2l4RQ9BsCnbJ2RtDw6h3911GcXxRsBcOmcvavklnsoNoFLADykVIFvhDxWdZbH
	 FAb7Nt76p/P/IVQuyxc1ZoOJ6biIBXKh3AMcjIMbc3CP+LDRIYmWOi5BhFRvlgE3NpJ65
	 WhixBAX7FyiE1SoViiDStE3ESqekBH8kDb0RA11CjjKZzDNttFofLhlSz/7C2TIX11IJp
	 0uJMUNgu4HgfXmuEwTEq765dYbxna3qgNWlZ/4CAoBVz2DHXvLiTmnyDsItc8nQEdBgL1
	 uj7YBLirux92FkMudJ9zGm13y1a6TtI48BW5LXhHDNJuoRpArJTaJ/vo6qQ24vJ1dDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
	b=Jjhyqgf3eBwwTl5NoB7uLOLiXkcnmbOA0C0WFTJwTEOQGYJ4EILREtwtDCpT1C0j7fS8
	 Q7C+T7RcUiEtNghYEaLSr999XjvJSbjJvRNbpfIHcfdEmDiQhSiXlIicxft3DtYzkNdMB
	 USdlqsGWrTCxoBxM7RzCtKzOHZS0uhVSTc6ySrTb2Vm/62yX3CxmImcAEdWvHeXXh80HV
	 T80j2Ka1sBXCI/pKjwdTZfi+aKLBwYnCTi2qM93FrOsz7F2+xCCWLmNoFPnTF4YHuv0cJ
	 Tv8KjXBMsHU8bNpvCOzVJJI3O3RHA0k5Qn2BUYLNJMqRs08/mHMY2Y9I2Q/mb/l3zog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CB606A6BE
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 23:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162CB606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so1272224f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218404; x=1795823204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=OTSNHd8PFCoItCuWZGXe8z0/gGI5CMB1ZGziKYvuJ88n2y+8WFH3QDvrqwnZFVwE8n
         afYps7ElSBcGDcYvf5xQbGXPMMQQUxMv2LxOcslinTWT4eoBm918jdOjODb6mmi/5IXM
         mq6z7CjbzBZHzrzosqPcod7REXyYhp2KclAmeB1uc+sh3itIoynHLD48lKufEXCkW6GY
         ZhJEPwc1H6FTfvjgxSJtMExgF87wHF4C3PPEfQgToSBlmXolmgLGa0Ctaw7l1f9G+W23
         mTD9A8Gja1HMz2Sn2+stjkIddPDJoJzRPRuy9R5z7tYPd5NRNROoQWMC1Ak4/017jOkB
         6/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218404; x=1795823204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=NbtbT9mp7WzM+QzXjrjjGVz51C1JW1g1O24mhkVGD/WN8/rr+E8IHZG8y5Rssjp4sZ
         j8SH9WZjtG0NPbwZs6Ab/gcyZgD3DhWRQB9z2L9m5hIyVQXGLj+Z/HZaGpbLCC2pYl8Z
         0fp+P1xR8RKFanV6S/0OMp6RwLmp0KC4G4hbcCIXEN5Hwmg2TzwQJuNCswvkgf4kmmFu
         3TgeKuisVXXleL2ChMmB8ZhP/VoN4DYKe4fTSk12oRZ1TkzV03IY+nN7fnvhBwYvCkoG
         wCv4jAHivAsVmWnZx+tehT6+BbAGsWhwtichIVuCySphVV1tT7atMq+TYuu+vhR3F6x9
         /N6A==
X-Forwarded-Encrypted: i=1; AL+hErEpmu1blMdAnJ7di5PxjYFY2DflXNULUZk7QKFE4SWSTIOU8VMn3G2ShPACS5tPra24jcnVbd3Qa0JB+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hoWRHpnPSmb/NJWmpN45zzME3I/q6CKYpVYYs1Gr/oV445apa
	3HvVal9LQuoX5dPJSQ2x0JPYxmTryJlvN6AB+YZnomTiVK5Dc/7TvMQM
X-Gm-Gg: AZFdTZdyghZ3QE8ywSVsVKG4S4gVrsj31mWgztlzBbxRx/IuQIpYDg2T9LDlLWgKmC5
	58qUm9Mpg6rMWS2Jv4nGDvYDFEEJvM7zgQxNDYmDmJ8T+RtBsBEBJPZ15cquO2I0FeUXTC8G/is
	q5dkRUuc2h/9VHjwDbcXJWjRjqJWdVajtLByqmpGURN6g3CO0hbt6Z1yRAJ7DFIRWyISaGKv7mm
	f4NsxNOfPZjIvqqlsr3hw8MuRzPz7SeFqXzIw4x7X+Vi1wWzXOA3h/p5aSWKZKRSl0JTN9Y0+0R
	qY+Tds+qNg82/V4mBcj4xk6tfWt0Cof7AcziSnPPzj3ntYODk0Mt6si6CKgAPCdD6JN+h7lVWRf
	LhmOjt7TOtsMfwewUS9p4/Rccieahutt7gMiGpz1OSkh80iAR2FTC6vh0E7tX5RcIP1PMnQBcVq
	hc7PpaHSZFiUrJRmr3cfgmY8vW1wQpkbpoXZaAQ5wHD8fqYA6c7gKzlXyhcWfmwduPS3U0iLOHB
	+XaixuV0bdD5HOHijox4vfGPK/DZFdfjsvwHtldrLqXOwUqB2H1mzlBipXf010GlH62wdGjoodl
	Qsa/hLX7jV/zVyEE5/O7IawgNWMA2k/Nh+6cDcVRRB/teWHSIngPFnJnX3XIu3l0SWi61w0JLw4
	mAlAnStLC/9OK0XOMXTo5Xv2wXG22jnKLGQ/gqrJc8lFoqiuc23Hp
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr9327034f8f.51.1795218404426;
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] ASoC: Add support for AN7581 PCM driver
Date: Sat, 21 Nov 2026 00:46:37 +0100
Message-ID: <20261120234640.169279-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v7:
- Convert to C++ comment for the first comment block
- Configure IRQ_NONE by default and use correct type
- Set snd_soc_pm_ops

Changes v6:
- Better handle IRQ with IRQ_NONE
- Drop wrong DPCM values
- Add comments about CHBF_OFFSET
- Add comments for HW pointer reset
- Validate that slot fit in the BCLK
- Add INFO_BATCH
- Fix wrong define name for 2048KHz
- Drop unused header
- Select CONFIG_REGMAP_MMIO

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  11 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 929 ++++++++++++++++++
 7 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

