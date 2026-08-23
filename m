Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5402D322E
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498864; cv=none; b=WoUeX7z8dYD2HfEpMRfrqgbQ9pCz8jDP+nS+mg85uJzxQ8+wGM8vCDRH7sR0+8TF9PgUpuSIJgHVxXtYSyloqq/XiIFpTngoXPmvy0FIYEIlaPXtMYS27Ob2gLTNNkTRIOWufy0CTB8hYg1E4K8dkZCvnKRX18eHDmia7AhPZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498864; c=relaxed/simple;
	bh=vQcyHaWKrKlFSj7e4zjhh0vEBXvEeG+IGUTVbHxkHjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KPvDt6pWKnEshTV1aoAfi5L9qx3LD1MWPm+qyRxAOOV4XU4a1hMg+iyWaiF5Jp/LyGuMr62AYzIRkQBx+mJPTQmxMeps2vhuQzK3/GnkGKgIIKk+x2mhvG61HnOFpjcBKpTMQiiPjJHmjxkk2V3sFu0XL2T22md3Il5UQchVhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=mBaLPB5U; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="mBaLPB5U"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso2262102e0c.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787498858; x=1788103658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTavdf9vKNF3ej0t8P0J3CpfvB0uFcuc2DSPX9VLBvw=;
        b=mBaLPB5UY3hThNzHvHJqYUcBSArobOtEEqfV4crW8gdPsYjVz2WsOir3KN/9ZvnjMU
         GreE97C1Mu1SspsrIlPCIAluxf8wQGvWhIlArwAwKL+6n9KRjcw/XIkVsBMAWYoimwKB
         n4C62JCsVQ3AwM4giPq7uzbiHQsCnsuUui840Ppc1+hHBZp0Fi8zCFXWNm8Av0SdgKDc
         Mt+ez34/q4iyBULhvfvDrNSDpvrwoQT343i5iz3yooFlx9McRXU/trAS9F7ddF/dv0AK
         wQt5AV7QJnsnjYVtSwg3AOaYLJs2fF5lPHXbViWnaW2IyaHMCuyw3IBVJzZ/5VzZhWXH
         5fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498858; x=1788103658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTavdf9vKNF3ej0t8P0J3CpfvB0uFcuc2DSPX9VLBvw=;
        b=Qy8YDb3Iy6dJYTqB3eO7+doBREiy6MNkvuuVm4ilDxOuO+axAja/KCUDKXOWABhp77
         vgXXmcjW/pSnFSl+qhEpJLejqSQy07YauPAFsb9fq/tFNtzCMoV2b3FIIS6t9KQUwDrO
         koQbsj1msk0h8FMqJC21mFyCeTcYfPvq9dieJGvpFfkTE3UmA6JuydpGLcymj+v0drwh
         BV/LzFR8dj1TlFWiSHIrEAghtP2Uzkyuw8V8toJMCQwLLcTN3XDIsWXLVGs5qMlAnyeK
         FoPAgPucCcryHuDt383WpO9N15eb0ic2834BVZLCh/wuG+sro/S/m0O5krgGAgrCyIyi
         h71Q==
X-Gm-Message-State: AFuF++mmPIg+PViVsZGQrRPVjX12OZWCvCsETM/pQ339P0ZtfDIBj51S
	kI3LXMLni8DiU5eRKKtVRuHAtPNUpvOjccXVEewOfogtG1il+YAfp8a6JzFcJrUwJpg4/AQMCkV
	f6UwppFYlVg==
X-Gm-Gg: AR+sD10Odnf+k6UUpzcwGrNS2Q7c+sc7psh77MwcVt1YF9OUuTqSQ0M0WrQydDvTRsz
	Hye1d2PDXjS5h9oxh2cAjlvT9axjDz6NuSSy0Ct4jkxUktprkKKVAQ+B752Cf5jTuJP/FQx22nH
	J2g3eYn1tm2u4YYPrNGCgmWi4pmY/RXByaPwgZ1d/A8cm361tS2MlsFXC8/dMMQx0jEqgY1NaBQ
	jFX3J1YoSk3ErYdWAY5dpjOq5CgOjRxcJRCUZvseJBRRk99OBaiH+4VweMzXhykFOS8tKAkJsDL
	dwMbXvHDn9GzUQfiArouHzH7au2MhfYScT2t7GSHAvK+69jWtKy1hYG6DoyKoZEUCXUmIdPSWnE
	v7x15Wq41Pf39e4ofk0cMd26AS0dHyozhm6JySOFNfUxu4OhBvtKy2AQA/mvni6fSPv4bdUhBlL
	1dPTnkNjU7NJ49mQhcApquJi4gEu/GWTb6gHbVkiEqUI/RxF0BO4x5DJoPBGUsRv9nbFGL2lYhr
	vDxdacHeqdALvOmTzc4uQ0t3A==
X-Received: by 2002:a05:6122:e252:b0:5bf:9461:91d with SMTP id 71dfb90a1353d-5c60de68422mr5738191e0c.5.1787498858356;
        Sun, 23 Aug 2026 08:27:38 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623f3ea39sm1494689e0c.18.2026.08.23.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:27:37 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH v2 0/2] ALSA: usb-audio: Include M-Audio Venom Quirks
Date: Sun, 23 Aug 2026 12:27:31 -0300
Message-ID: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I must have done this in automatic, sorry, as I was testing through
modprobe.d, I didn't check if the code was working correctly :P

Sending the quickfix, thanks.

Changes since v1:
- Patch 1: Fixed typo, QUIRK_FLAG_MIXER_GET_SAMPLE_RATE became
  QUIRK_FLAG_GET_SAMPLE_RATE (reported by Takashi Iwai)

Federico Valentín Andrade (2):
  ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
  ALSA: usb-audio: Skip mixer creation on M-Audio Venom

 sound/usb/quirks-table.h | 22 ++++++++++++++++++++++
 sound/usb/quirks.c       |  2 ++
 2 files changed, 24 insertions(+)

-- 
2.55.0

