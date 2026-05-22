Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05A3905EB
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443662; cv=none; b=byqBPewuxmTYxTpedxrBQ8SEljA9Js1i2wGv8c2TsvwrrYAVsNheMgq+6pbG08j9tXuoAh0AHqki0tBuwYPYGbm5JnL/Y4PqRwZBprq6g0iOgjqSnbxKThrkz9lu3NuXb68I0Vy3924Vax+0Q1SDiO3eQs/IAzT0mcJmwEinu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443662; c=relaxed/simple;
	bh=VotcPBCLiCVTfNbIs9rB/f3jkhHrsiX3X+HPps7twDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=St7z+IrHJ1ZmHNDjix65EInjPs5TeV3wS1Us24SesuVsMyRdHceEv1qWNb4zNp3EE+360JQ+eflgCbgd7v+PlOn1FtvGk22QBZtmI/F+Z1Eyl8PQyFcor6VFgPYUTpQJ4QGOm2lL27h/6ytPOgsXJzj9UaO74GYJEr380zqJKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUVXSuO1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUVXSuO1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so2942995b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443660; x=1780048460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=cUVXSuO1jv+1xSgvn34/Rh7n73vHJO9yE0KWZyoNa7z1avnVylN6VGyLlgWSm5bVew
         B78ynkCnL+pqiy2jBo05VMXP+Jz/O7SVWPozhLNGSatM1ccSfJ1giOQOklcovB7Jjk3T
         d8L7AHDpWjGNxPbJz1MEWjW3tn3iqTF6bvs93p5woHVrVGyAjdPfIJE7xJwQKXCyl3Wk
         ZDgyHkWnD5lY5Kzbo5T0T7I05I/I+M8+xMxDby2mfo8RL82dKaziuoadQcQLDPYHP0JN
         auNUpFPrnkHFTovH8hwhjK2JnTjQQrI8AfPU7wj1Fzr+1bDkEXMjUHmRvrrSzHt+VgtI
         E96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443660; x=1780048460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=ENLkKlIh4zt0fDNIHMC1hcRwMf9y62XvSlGchCqNaxZQbgJaXheN0ZzhoudaSYmb9r
         xUfk2pBDTE6y2SEfqRN9WYrAv1T82Gof1fnGEgUh8V7XiMAkz/aVUQxHq86xNH1PXsXG
         eIHcAC1LuJhP4fCx9zyMeGg/8cE+JrCPbYZ2m2AcyBmj8rgvnog5jOm7UYblxQn9amOG
         HjZ9o8kkxPC6WY0HbjudYrjT7k6M7nrZFISl22mMBVEHIp1zO6xUb4T4kXXoHntDoiUD
         L7rlfm5msgBsvRfZPvY1c/g6CvF2K2Z73SWUgtJ5eM36ETD7SS+US4GfKUlBQbmXHeA6
         Q+uA==
X-Forwarded-Encrypted: i=1; AFNElJ8HqxyDlhEyKBDBSfzVLGrW9H0zzyl7vVZt16xNa6RALpmJ8OnXY1qqEjXD1ZhQimw7Zhzl44G/90S2Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZZG2/08YL6WuYTVjhFYaL3BPVRZ304PLilW3/1B8D+BCKV2z
	4tzakxOA7NS9gSs6XuosnZ2oM88RvsGzFaXWLpfaSipEZZnsc7jqHCs4
X-Gm-Gg: Acq92OEXRpScCZHYXrdcULTvMc//PFrFmqSRSCiELEKbRNSEHI9PB0DU9I86n5fswzC
	SKIxjNjAD6B9H4rjuVOc5U93WOGidWXsfCbJQc5n6UnQOAq22TEmYOKjGmmN9Jt3NUygaaVO5kk
	WIO2vqvDb2isWp5myRPzo/+idkJVZwJDFTcIRpxklSWNZulamQvxUT+4HFpupFOd1eOiX3TTyfs
	gSIBEUAghZJ1kwPb7LWQCIpoXdTU82/xSYbjACgkEAu1l18/lwe0DcZhwAr59Owc1sjLMrGUJ/s
	+oKdj6d72UI+v+R4R8bt9HgmgfZpon3Zs6jkyG5Mnf647lZMhTxcLWWEG5fl/La+FpqY+wyQQxs
	gKS8GCxZ8gcLL7q1J+ntzTsdIVRCR5dIIPzxUKW+MnT31P3ENO7ZJu90mphLLp10P/FsAD+Cka9
	iWNdFUretwS5H0WMfIQcjUZ/0EcZ/KpP/XkvxmvuSKY7X3KX+OmOrngCZRs1M7+gfUx6Ux
X-Received: by 2002:a05:6a00:419a:b0:83c:5e:f647 with SMTP id d2e1a72fcca58-8415f5a64efmr3131038b3a.29.1779443659746;
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Fri, 22 May 2026 16:53:58 +0700
Message-ID: <20260522095401.72915-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1: 
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Change in v2: 
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
	
Best Regards,
Phuc

bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0

