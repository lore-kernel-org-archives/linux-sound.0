Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088052;
	b=lJErrqLPm4TbPItvxblVPleWpaQqsuK/TbhjOkKIupGuI1snUtOWE2FN/H7QHb79Fb0f
	 KrVy6qjYhCTWcFReybkxpHJoGUb4Ms1MSlkgZilqk+g1ddCZ6MCYxI80X2FcCaFRmBxCP
	 fVyRGMntvU9uIuvX+4FCth5Ra1N2TOicgLnY+/mQyksKlUGzFC+tgcBbfqhmYPGrPNGhp
	 bAOfmbGoic1WC66PkEPuc+6OnYeZvnkJMU9EMhrdtsz4vU/109nDHFAba6HJNYRTw5g4E
	 dcx6pbekLhbq15PHUqeUpNMMPQKhuu5KEogNvrd4QtHDkN7x3nFW1swDudzzYMQdPtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
	b=PTp5B5f7vYGoSS5+SGMjph0tjS9WvjftmJ4Y2J8RkpATWJ2UKQd7+pkrwzk4XpeYs9WJ
	 VSKNTs0Xrcl9hgG8xlQHqI6fhrVEwznl4hQLxqxS6WgL4mG8fQhk3H71OuKIIOs6+esB5
	 AntfOiU1kYQ1HYKX+inEsEIaZ0z7g5eX4dxxgJ01YeE5XPk+/lItBuBzpiMMnziS/VvBN
	 Esu8SkVpd2bEOl3ZvyQpkeCZwuEq22ptMvum7HXnTE3i2N7CRuIHyeokddwRoMhXPl/Cd
	 dKOP7TJyj48r1UxFYjk4lFBIsZ9kLeYlTJJgdYXJrTmufAZiPqnj/vmj5gJV3AHbaCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="beM2/FSN";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FF9606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 21:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beM2/FSN
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85f39332862so8501a34.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 13:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088051; x=1794692851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
        b=beM2/FSNVFndMgCOkT1MlABfEi1fk+mbDJUcWakvIzDXPFpw22jgVXX0imQpRTSmRy
         wwMOTqjJMVnMAhTTcwl6aCeAsI9oocumRfHrQJPk/Z5yy8vKB0/fDBdDGn+ptI5W1yF3
         1l8WvsfXqw1hMUxi51NVkApdvH2tZ+NnG9IA/PyGr64qXo6eDpRc1pAkUC/EgLJXY5T4
         nVvIPevFr3omJUWdZi6T/pLv+PA9Y6qiG5Tto3qFuc15rWgZRXHp5A4hatEVbEmeDQ04
         dle6KJv3XifexVu7FQcQipT+UiGK8eJ1NOYQZc1xbWZ/sKxC//v9Hpx2d5khEVCWoW++
         YMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088051; x=1794692851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j423QJIYSLLjA6YsokR6Ug1s+FwSs+Jb4JVUuZ/0uE8=;
        b=dh+5k724tS/tYYgYM+WyfSABLpKEe9/a5fWwlRlCxHRGG+qnRCE2XTPM3fxvfttXq2
         CSuJkmk8enx8U2dHPJW3j2EmqYqdsSQG76zSSGPLeH+D+Atb3QPTrMCkXbz6GHzkHPRG
         +9DoMDgJqTghqCtr11Xz6mYD4koFcy7QQc+CCUhrZhvdd1sfMxbueMxjy8N3ir0O9NVe
         zFRlUARaKpyub4+NuJ8+FJJ+vEAOalQM46zeT3qYpV2FyO+CNJRFg9sBlJRseAFhUPE9
         TC+rVgycrqNOOSqOpaQUS2I/jMQcrjILhhalNOPFM7X2XkPeo+DglNzKRheipl5Dxy7Y
         +1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBx3B3ZsPCjVcVdqYpU7rGzVuuxNpDMBRgAHTub5ZK5eEKTVprziHtUZnq5GJNm2oystSXHZijRTSKdLSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZjzCe6192gliG/9HiRfNLzZGEPYdOnu8/Uxt+9xtLC0Ao/L6i
	iiQr4HDv/PGuv/Pgd7f/Xj3MaaCvRt7lAyH68MfmDaZ2T13M3CBGvK0Z
X-Gm-Gg: AYBFou3UWWUAzf8Od1GWUhqTOdqI1Q2Z6dI/898K9FcIgXS44/IZwTfWdBYhc7qdw6p
	wR/KtQh9Ov8febyfAnuRjRoPt+YXX46nU3fY2gTRi9hzNk0vcFa3euDGH05QfpT5EzMsunlrazf
	EHpbUCKLEXQlUNyh5q91CaiGUE4ZqkPAowM4cjPBaCRR2eZLkZNCRZKeM1xWxBnnxRDPQANS6PA
	hkszf66AwpyuQFCFcBmB57IGfHxFn4PQhTqM2v64VZMOyXJnRxXKr0EnudVsH2sl8fxnNXR1UQI
	1hDDUvU3/ACZJ+QpfALlocHEvDWCIsqn4GGPYgRGK1I8uGA9jfOzBC7z888K7vkCSVQeG8o5Dh9
	3l4xP1X3xWyGJZDoKH6RNETAqnrEbrxwiFK3wHq4D0l/HaaubcGxUrzDR9kM+9ytyWqTo70MDnG
	qnXulqsAzn1hB2Rw1rsRJLZBUSshrN2IrPSb67mF4tQQMAuSxxIL194QQhYRkI6CcTBmah8Ixad
	aq+Erb08A31WA0CVbkW+/U4p89xVmqS/cD+LUjXBABcxlJxXI54hqh1rGtoZQXC9HqRuNITJnB8
	j2MLVfXiYNc=
X-Received: by 2002:a05:6830:25c2:b0:7f4:eaa0:1d14 with SMTP id 46e09a7af769-85f50783e80mr66616a34.9.1794088050868;
        Sat, 07 Nov 2026 13:47:30 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:30 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH 0/2] ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 15:47:12 -0600
Message-ID: <20261107214714.11392-1-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Huawei MateBook D 14 AMD (NBM-WXX9) has the same ES8336 + ACP3x
audio layout as the already supported BOM-WXX9, but is missing from
the DMI tables, so only the DMIC-only driver binds and the speakers
do not work.

Patch 1 adds the DMI quirk.

Patch 2 fixes a pop heard every time the output powers up: the
amplifier GPIOs were driven from SUPPLY widgets, which DAPM enables
before the codec output. It is independent of patch 1.

Both were tested as an out-of-tree DKMS module on the NBM-WXX9.

Samuel Leyva (2):
  ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
  ASoC: amd: acp: es83xx: Enable amplifiers after the codec output

 sound/soc/amd/acp-config.c                    | 14 ++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 34 ++++++++++++-------
 2 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.56.0

