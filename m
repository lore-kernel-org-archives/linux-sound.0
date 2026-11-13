Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556657;
	b=MethjEsf6hfRyXH/lwlF4CkYxTj9DOzK3UCgKUbVZRM7rwLb/gP+4gVKsGrSGCzFMs0z
	 0LJL4dpgJPBpOPOllaeTxK3W+/B/9VTEOufQLisjxc/534CZZgSvb9+a1cL6AFRvxsFwi
	 r7S3UO95uf2Bh4wvNj2dwrmP5K1pCC7afb9VhICNASuxbM2anxYoI+ze/VYW/jYZ+JcTQ
	 8H+GRg4ZwkR8PC8sPlW5MUhaPw2LBpSp6KBEZOyzqDst1T5mHdITYglgv15SfNE2JHnOm
	 oqorZ3Au1ejaTSedGzbkMyek2YQocNQEVP0hT69vILTO3jFmOgAxtb3FmpBOIh5XKvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unPCWJwYB1tZs7CFqUZ99dSuZFBml5Pw5Jco8PgJGMY=;
	b=l+4vOMlwwGjc70sfsgxPGdTOAtCuru2KZfr+HMrouzexUBlIexb2vul6lUL9dg2LX4TG
	 okc7DDVVZQhMQyTF2mwZ6P1blu955rhSpuJoZ8MRiNwsCEvaDL48U3x6G6vxtnmMRy1IE
	 8cpKwj/gEfAmUBxVbLpNZbJ9ITE5447lLLMJfYatrniFGq/uVJNx9L7XQNhYYrzlp6SLC
	 eWBC3Bga1+/X7InrNasK8Z5AiG4t7ICraS/5wboGvKTwPj4kZeZdW/PyiNInLi+60eRfo
	 oCvol0Ipo6Qh4BA/JqK8RZOuQU+gW7WI+TuexCmv9X98+IXDnryPK4i+GfMT19Udweg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owYVeFzH;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5747606A327
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5747606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owYVeFzH
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so877962b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556656; x=1795161456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=unPCWJwYB1tZs7CFqUZ99dSuZFBml5Pw5Jco8PgJGMY=;
        b=owYVeFzHBbDYpZ+CJJ6Y3JXV6g7NzkZpH1dSvU7MZUHoE8u8pEJLGcKPBn16M5MpXF
         8/qWmGGsZ0dOZw5yhn4sqj8iaEkKiRYaIxC1I++ovrmRvailrm7orsf/Xyx/w6QBx0Po
         DDd4F8RoSYXYRDnvTw7u0IBCVe/VVCjbG/qgHhkpietPD5/liNAWDyOTjczvepZG4zNE
         lPncVGNS2wQGjRZipOpQykW0R8Hka4W4iPVPvHHwteUDk0cRn7INvShr8zgGB5R4Uaoj
         ojeosi+BXUPykMvUHz6d64FHFWr8v250xYPw2OQAp6kRI9B98IUzEfXHEwnlMESPWLui
         uZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556656; x=1795161456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unPCWJwYB1tZs7CFqUZ99dSuZFBml5Pw5Jco8PgJGMY=;
        b=pyd9S3+nZSpsA+dNfExgp0hvDOXkysv0nNaANaMPtvxBmMPBr7R7hUHS8411ZVRdTi
         9ID23KTl/PanvWzBgUk+5bCtWve5GakH4tIWesQJa5z7gFq9UkQBuXkoWGHB9GwPyuc0
         jVKk+OL9yp53hW+dXAWy+kDubqTbBF8HOJ6QoHwCS/ijYmhBO3jkcWgHpy7GyMEQ/6hF
         Vu+YhtS0jlHA8C15ExyDddN737WdXGR5O+qoC6PympGB37jIQS8XBUxJEStC5/ZEDIAP
         UqfQPMc8Q9hmL80oZnLrDay/dvRvX2DKzTCYvH2itF+W/02pur/ALyqM5hQz/rKyiTvc
         Pcww==
X-Forwarded-Encrypted: i=1; AL+hErG9puji0aTYbGASOEtN6cuzXzbIaCnvTrlc6ulae/mYv8T+ueP0VjdvTEb4ZhAfml5UZRzkoxx3XdkHqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BDS0nl7vZzxD0k9+1UNLRoD6PsDXwpsAwwYg6ZfI7Ki8+N7nN
	3hl/ZwbAUYKr7Z5oLICO1bADMOC3lGvaxMN05T3e1Xra5xF3iKpEhEQa
X-Gm-Gg: AYBFou1ZESfjtZn6JSc6aCpTtpe7wDXI1c3BMlP/JRHq/lmDK4Wg27RP0n6K7ahP7Lh
	kTt7PC9NcDmT0wnfWgiGtPQjVZA7jbWx2lIK+CKxbrPkJBjlbgAy8rdPiOZzSg2toTGq3++/jbJ
	ao8Lh8mO6udBOTPMVtpmJ4rXvGl9+Q1DyMNMy3jxlEKLAVTjWMWP8NXDUo0Y7HBfUlC/daBmkpP
	Z4D+swejyBC3BkLFzTiSl8fZzJiZAKvXR2optRU+ifNjgrLFWvgabIbUIKJy0uwR56RvUcQpYIT
	61cT87hJV6Bt53CnTGnCUwfdxCihUVj8CK7t40iY055y+/ZtlcT9N5oIeR+PELxZCDLdFeJqFxv
	m4yYNT3KobqdprUe0eQOJUVo9qiscLzPnQn7etYByXzlTdkfvTXq6eLAFhIQsED9ynThAmwA01+
	fGgpZlTPwVd72g2rvSI8OKw01iXCglkmVN3I8oBQKdyhipJdxPCEhYO6SOCsPskxrznnvrzoyLk
	NYVsvb9Va6d+io5RTrDrBUsp/S5W4jpSan/AYmgzdMbV56zc2urDU/MDR45X1tRrRI6pVE1/F+N
	qpEkdKgIeyVc1MLs7kNujLyZtXL4RdROyaXpGg0J06oJhyfab1gJ2HBzQ91NUS1Qs8W4SaJH8Ca
	CxeeSDiMR5na+GQ94JkZCWmQDT+NJLLHMg8tmbu0OuhSok9pHFWvvNK7a46gWew==
X-Received: by 2002:aa7:9069:0:b0:8a5:a8a2:95a0 with SMTP id d2e1a72fcca58-8beb88d3244mr1729225b3a.52.1794556655614;
        Thu, 12 Nov 2026 23:57:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm681714b3a.36.2026.11.12.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:57:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: ASoC: rt711-sdca: headset detected as headphone after runtime resume
Date: Fri, 13 Nov 2026 16:57:29 +0900
Message-ID: <20261113075729.1441921-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Shuming, Jack and Oder,

On a Dell Latitude 9420 (SKU 0A5B, sof_sdw with RT711_JD2 [1]), a
4-pole headset that stays plugged in is sometimes reported as a
headphone after the rt711 runtime resumes. The headset mic is then gone
until a later resume detects it again.

Each of these resumes runs rt711_sdca_io_init(), which detects the jack
again. With a CTIA headset plugged in, GE49 DETECTED_MODE came back 0x3
in 17 of 69 resumes. Plugging the jack in gave 0x5 every time (5 of 5).
With runtime PM off for the codec, it does not happen.

It is not an early read. Reading DETECTED_MODE again up to 800 ms later
gave the same value every time. But the wrong result arrives later.
From "jack_init enable" to the detection, 0x5 took 0.39 to 0.42 s and
0x3 took 0.47 to 0.50 s, with no overlap in 48 detections:

[  947.426026] rt711-sdca sdw:0:0:025d:0711:01: in rt711_sdca_jack_init enable
[  947.798095] rt711-sdca sdw:0:0:025d:0711:01: rt711_sdca_interrupt_callback control_port_stat=4, sdca_cascade=1
[  947.832056] rt711-sdca sdw:0:0:025d:0711:01: rt711_sdca_headset_detect, detected_mode=0x5

[  930.117765] rt711-sdca sdw:0:0:025d:0711:01: in rt711_sdca_jack_init enable
[  930.582117] rt711-sdca sdw:0:0:025d:0711:01: rt711_sdca_interrupt_callback control_port_stat=4, sdca_cascade=1
[  930.615049] rt711-sdca sdw:0:0:025d:0711:01: rt711_sdca_headset_detect, detected_mode=0x3

The rt721-sdca driver checks the jack type on resume since commit
e2eb4873b901 ("ASoC: rt721-sdca: Adjust blindwrite flow to fix type
detection issue"). When the new result differs from the retained one,
it detects again. Here the wrong result does not change when read
again, so I am not sure that would be enough for rt711.

Would starting the detection again help, or keeping the retained type
when the jack was not removed? Or is there a register sequence that
makes the detection after reset and calibration reliable? I can test
patches on this machine and send the full logs.

This was on 7.4-rc1 plus soundwire next, SOF firmware 2:2:0-57864, BIOS
1.50.0. It also happens on 7.0 and 7.3-rc7. The codec reports
RT711_JD_PRODUCT_NUM 0x0021 (hw_ver 1, VD1 init path).

[1] https://lore.kernel.org/all/20261106064408.2224910-1-sammiee5311@gmail.com/

I found and checked this with Claude Code (Claude Opus 5.5) on x86_64.

Best regards,
HyeongJun An
