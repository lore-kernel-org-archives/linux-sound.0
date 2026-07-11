Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1832C8B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732307; cv=none; b=FqmPS7LO/2GxJf6MQD19SmiAFdoaAb5CYZaks5WCCw0HsYfE0qxgTzbBxg6kVSyZsK4FaGPxPrliJ8xjrfoGDEsCjeE3MxxSq6kX3hlD1e0wjUtKRYQ+jlgcLzH3E7tyM61DwL7UtZN1C3JvPEnuPbtWdGRfgRLUiOmpE5D1UYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732307; c=relaxed/simple;
	bh=hXFOnrwzN/Fwpr5HYeSXEfo2w3MV50Nayvg5kYNp94M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SdB/DCeGMAU4BkMzB5Ic5aR0obEXzgSIosw4TE/UUTT24RMCuW0It8hNO22Tq9n9x1jNN4e0DB4qGZ6yYn3Nd9pr7TIcoJd/mdMTSVgaGOOgTbb1/sln6RUy5YIwf1zOJzTIZRIJ8aUlw5aq2+A0feswhvgKNGU4ui21EwyO5JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odLLu7ym; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odLLu7ym"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so845078a12.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732304; x=1784337104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g3VNZH5oI3L1YXrYtuo88tYkoHndAa7EPBS4UgpLDK8=;
        b=odLLu7ymJxvH/EhexV3YNb1np3AbaQN+ZZPfgB40JGNraXyCx4gwYd4JDk/Iidg/M1
         F4iz3lSQdIppD0xSG59D3z9hSUFFUQmOZ1cu3n13YV2lx/Xr/cXIn5M8eMtQGHbM2Yvb
         uobDg0mNe6enPwm2daQj69aEgx61Uj62DXxh4YaT6AwhvUAL5WH+qbtj7C67A4tdHKu+
         M4g3ktgFbhoel/LTQixaQqOU5vUbbcrHDV6qdNyOwIo75E0Moyq3WIiUlkR3leM49ZZG
         6uSLZYhoJ/TzcFaG27cddKN7y2lXS9WeSKLaJrenyxU92mUqmwTBZc4/250YyumJh8MA
         TeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732304; x=1784337104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g3VNZH5oI3L1YXrYtuo88tYkoHndAa7EPBS4UgpLDK8=;
        b=A92YPBYOwsc0xssJ/iczLJOrMC0pNCKhX30swjpgYXR8c8s6/vs9Ao9xDJW/c1/Cks
         eOv5AQxTLnKEypJ6BZKBd5Quw0Xf5QkqCUHCsqL7YCjj+EUIK6hW7x0YuVQwHEvGVXYJ
         x/DQ1VKCIh21VmFDlXJkdO2UoqNlXdcivCgpQhQj9x5xJlcYdaDQ6KMprEN29xd0qTPB
         by7HTTWf+XPqWNXThLosX7pyZmNPGXLbqIOVyInzQEJnb6s//D7SWC7Dkx6pP9V/kGwx
         hoWRFLIRMNzCFiu7mSBVPXtL3H794RocR3gaMTS37IVdXhsvrNedUKeK9t2Egty3x5vj
         ICpw==
X-Forwarded-Encrypted: i=1; AHgh+RpyT4Wy4vLaEWavwK6zCHWZu239yd30gtt+9/qhu3/h/o564YQw2G8b5kdxyu5BOrtkTP1tgVVBNNu/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTO9RHf4RXzeL2nabhzCadlOF41bK/qqTfqdV/PcDknGI76ywd
	Sdzb4bLsUxhrTRmyfTARcTa9wrZHqopHXg/D24RHLvtMOVP7PpZU6n0z
X-Gm-Gg: AfdE7ckG505aLfhGZgje8JSO97X9y6sIY1FBOj+F0rxCihaTas6jJqCrzRzYKJRXfEW
	NdsK39IHEi3R+2bXBxcifmaed4ird5Hdy7PHGmfSTKetrjEpXTB01nOSEoyLCWYMkMrakK2SXdd
	RRU3LLqFbW+uCQO3KjUFYvLR7oRO5WA2JPd+g6Zzf5tFdBHJx0zjAeugCsX87K+Da10PVASUt/E
	qtLpqFdQmIti3FRerGikCrwQnXffrhOsLz+qEjo8WwVRMzJzCTKWxLkKzQRgzexNy+ktOB2XvTG
	hw6FDPUVmYg4vLWuKV+nxtbkcTyRsk3vL9BTWeZhjzxnfHuA95yhUa0vtPjqnt/2poi9RnuU28Z
	F+h0fByROlgVHPThezTl3dcXUQjgPbVlGj/5mgDzL8NfPhDQM0hqKAn8pr/rMXIOYchSrqiQ+sr
	Hs3ij/h8Z6lK6mINd8DcyWA24Wub1H7bpVgPu9N2vgp8aak4KbvyLTkuxSLEnL1Nnl80M96fk7z
	C2k3zIjPJdfLiQAveILpwNEI+D7bZbX7S4HZvv7pHlYh6/4mHiKm3wWZLwxHoFQBm1bpcDvqxQY
X-Received: by 2002:a05:6a00:1807:b0:848:32f5:4999 with SMTP id d2e1a72fcca58-84889715a44mr1127795b3a.30.1783732304377;
        Fri, 10 Jul 2026 18:11:44 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 0/7] ASoC: apple: mca: support simultaneous I2S capture
 on the frontend
Date: Sat, 11 Jul 2026 11:11:18 +1000
Message-Id: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq1pplDAlfcwLvozhRoQ0gLBE
 O5uwRhdsHyTb55ZSEDvMJBLshCPkwuue8ZITwnRtXxWSJ2JTYCBYAI4lX3fIJWjcR31aMaZqly
 l3JSagbQk3vUerZt383b/dBjVA/WwQduidmHo/Gt/OsG2+/rFgT8BZVRwKECUuhQZXKtWuuasu
 5Zs/sR/Qs6yI4FHwdpc5tIiKKH+hXVd31OmiaIGAQAA
X-Change-ID: 20260623-apple-audio-redux-b7b43d9c02af
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hXFOnrwzN/Fwpr5HYeSXEfo2w3MV50Nayvg5kYNp94M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM9wsz7EYCtcyFG7K3P3z6f2MtP9dsuLbPCeulud5I
 2y4y7miYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNV7JzD8r7c80ylzlNPruvoTy2dZXU/mqpSZy71eluYlcHGv0ZpXNQz/zKdbX9/
 jtZ35V3LByt58e8GeonPZjfvcdnXsyxb8evoeCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series introduces a number of changes to the ASoC driver
for the Apple MCA peripheral to enable support for bidirectional
I2S. This is achieved by allowing frontends to act as clock consumers
and logically ORing data input lines when multiple backends are linked
to a frontend.

This allows the Texas Instruments speaker amps used on Apple Silicon Macs
(Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
data back to the SoC. Since these amps do not have any sort of integrated
speaker protection logic, we must use the IVSENSE data and the Thiele/Small
Parameters of the attached speaker(s) to implement our own in software.

---
Changes in v4:
- Fix remaining port_driver reference (sorry...)
- Link to v3: https://patch.msgid.link/20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com

Changes in v3:
- Changed magic number write in fe prepare to BIT(port)
- Link to v2: https://patch.msgid.link/20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com

Changes in v2:
- Drop readx_poll_timeout use. It ended up being unreliable. Fall back
  to just bumping up the delay on SERDES reset :/
- Rebase on asoc/for-next
- Drop the one patch that was applied
- Drop clock shutdown relocation patch. This was not actually required
  and the incorrect thing to do anyway.
---

Link to v1: https://lore.kernel.org/asahi/20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com/

Regards,
James

To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Hector Martin (2):
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: increase SERDES reset delay

Martin Povišer (4):
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 300 +++++++++++++++++--------
 1 file changed, 207 insertions(+), 93 deletions(-)
---
base-commit: be44d21728b6646189779923b841ad3a46d694e5
change-id: 20260623-apple-audio-redux-b7b43d9c02af

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

