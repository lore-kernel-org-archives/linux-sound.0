Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80164192D97
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422531; cv=none; b=gdDAW//sGpTC187jTNIPk4+VkWBjAzWNbrwEtTmtKzpQlhw21PvzI/N/KOXlJnGDA9XynFPfqt9hWLePp+ArwjhNdBTGwOyWFU+tSOW/tODlXt+ZVGv65paFk0NEMae+tz4uOUB9y+d4ms7HGcWE5d8QbUzdzXqfj6Uv3YaWCjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422531; c=relaxed/simple;
	bh=fXi59JlJDT0EimxZ+ztpx3b/xSgicM8Y3UnGuxeAuS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIPcL/Y08SxpdVjlUKFMulPeF5/mShe8DARd1nUtzUysaxcZL6nDZo2+NdbLMw0Q27H26XEvBAwkRhPeBQi8Kv7gMn9+Mg5gCF5/yVEy0IolTx5YzH2IYHakIQ9OY1Omsa9FK8VU83MHoaQWDVnNDh8SsPXWObXx28irwZO76VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com; spf=pass smtp.mailfrom=edburcher.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edburcher.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441c99459e9so15578725e9.3
        for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 12:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422526; x=1748027326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F+jTNKCDAznMZXynaETtIQhUONuocfK2EOUOj6nxTs=;
        b=S1ykk5EtQz9kfA87zngqhMn8z43yGTkhQC1jhgpcLf1xLGuuXy9it3xAxUs1ZCZli+
         MYHQxfZZHwLpYIcE+OaGXTCGmIDRZBInV11ZgZCLlGokpM4aXSl6xEhJyJSi3FW62XV/
         SWTBPq0YfinsdHSVwiAt1evzNsCKkZjyVE4r7EPFzZX8ax1Sjw6dSPPgBeCfHyyingwQ
         afMe1oP2wUbrivz56xcgdZkM1jnWPChJP1GS2Nb4GDUxmApTGUVTOrfyzqD5IzOg+hON
         y5zAkrEeLiEhCal3VmZDfdA0o8/zGwRGdynw9sQcf9BATDToiELXZrYfoGyV9/crhCji
         /Z/g==
X-Forwarded-Encrypted: i=1; AJvYcCWKLzOa5U0QboSxcSNXcdIngOXJdMxYo9O35ByrSUVpFDZm3GNR/Fil8V8uXENAHcCJgTGTk/rsJl2BQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvB7qEqwwiQDd4x0El9wM+2lIpC9kuDk8Wssh0pjjQXPQE0jTJ
	oqkNTLh+Y8VpgH5mHBUY+VG8KEvAmDVsdyhT/Thbmb3aRiLR4ajIt4gbLsVacOhX2hQ=
X-Gm-Gg: ASbGnctTGrSpczisqYTz2TAawEVb9djeS1DM2OKzMHa0sF3YMxWh5H4jejJz/H5Oc6H
	P0cMUNuKUFHpwYn6ThLxk2RQheS37Bb7SAt6znyrk1NBEvcovFOwWy75T0qjiMf3PcN4lHf/ZVi
	WApmDZffxo21UtF/eXobJblNtDK/DTc5z+z1LrhxwMrP4g/x4UI3Ys28bUKJRdSUVxUPEhh5HZU
	1svdFj6/zgLdQ0eaR8/bueMl1qvIeDvbfmcxjf+68ztXv0yvfY9YUJgfdoYCO9Z+AmmXdZOOPDQ
	bhdrVG6ou81qzcIbvaapEA4EPWKQ5Ek2S+RrJvlPqEkcblb1fUk=
X-Google-Smtp-Source: AGHT+IFoqikLBBb0btsvnDcEkExpc2ruLlkPZltNCiKvZ0LH5ptwCOXTRrwzjudzEx1ViGYl81OsKQ==
X-Received: by 2002:a05:600c:3e0a:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-442fd5a2c09mr59185865e9.0.1747422526586;
        Fri, 16 May 2025 12:08:46 -0700 (PDT)
Received: from electron.local ([188.74.119.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88a34sm3706855f8f.70.2025.05.16.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:08:45 -0700 (PDT)
From: Ed Burcher <git@edburcher.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: git@edburcher.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/1] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
Date: Fri, 16 May 2025 20:08:31 +0100
Message-ID: <20250516190832.35128-1-git@edburcher.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, I found that the Lenovo Yoga Pro 7 Gen 10 (AMD) model 14ASP10 (board 83LX) 
needs the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN quirk to be used for 
the bass speakers to work correctly.

I'm submitting a patch for your consideration.

Thanks

Ed Burcher (1):
  ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.48.1

