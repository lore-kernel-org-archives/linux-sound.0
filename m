Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510105;
	b=FD33sl10yWpJwrgGBC1wUvy5/CIe1iUL/TlI9dqT2mFtgNWxb2la4PqUEhOUrzM8Lpug
	 v1QsiKjIyeXaCkqKGY66J7xuvziTmcq+J3Vt8GeQfhr1pDyWpElAEpNDikg5CF9XvgMbY
	 g3HmeYVq+gnglmqZgE/tdcbyZiVskpjV2MkYkHav0si2iA17zQXvgNZythb2TA7ltEGK1
	 bCevfEdu+p9Da2032G5ZwReLu6wfmw+VPlYDfwkmIQ3wOug/QR0eNXRmIetX0QqVH/emm
	 r6Yvfk2yFFBmsmSWoAycY0vDUCjVx41IuOEf8mV+FfKDjctkYUWyXp15+vJTq+RDU+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
	b=4BCqgzzAj8/9EO2/EgoO4tDJi0YhClvIpF5IU6bz1QOQhyk7Z9JqgSUk1L6hrf5cCFfd
	 tdFQ07pYB54n/qlWSImDBrJVukDzoc5PmFEKywqAb4tTxk5B/4sLXjQ/NRuzv3EMS03PZ
	 XPq49+jQJUWr++deIVUVHAH3qSM9lYAYkLVH38nsWWQqCMRZsdt9/aNsHbSNEJ4JHMa2I
	 GLyVZTMMmeTCBVi/oGPRM0Q2g68Rbuv5OPdzgZ7DX1XbiQzqWsgao9GbGB8+ynmjwQmT9
	 75SyeSe5y1b91P57bprPgyvR9qT2D1m53jfPE1/4Euow2gsQfVG4ocUJFvnNmAqtFbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pghdQcwl;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADA606A32D
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 15:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFADA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pghdQcwl
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33c10faf6easo374225eec.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510104; x=1793114904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
        b=pghdQcwlEqnfctzczBTAIRCLD4gRCtRZ5nI/9Lh/9OQhZ9ClaXwzpyONuC/7woEnUB
         fkd0SmI8V8rm216FmJX4IEx//otXiOmW3WGChoMzhd+nV0iqj3UR3ACFDjQSJR0ApA7r
         1u3Fnew44IOUUWPLoe3JfTyYqjq/dqqVcbaM024fVC4Da+IR433S7BmALAPvA1Oi2ucl
         Uvoc4cRHf+fmkiuNWByfdrUsxEdwq2l/znnWEBX9dJzFAfLWe7u7+KK9H6tyjneR0ogw
         bsKE4bdeNxcznMBwdDCnTm9pyj5hZa3FpjW7lOEHADuxmyBRG8pJRLL+BaQaqHUxJDxb
         CUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510104; x=1793114904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
        b=pz1vRITTg8Ypmd5baZwZqF9uDVo1XVHsN5WHyE8zmbZjILbzkIOoVP8tEh8CgUV2O/
         7eK6qjv37XES/zivUO8fDnflSSLEwrcuYFFQyAoeOwe5sPURWX/zuFTWCvzW2ZwNcEH2
         lyLmhusiyFHfv+cpXBdXZkM0V+PK8M2mU8yQnwSsR2JuHZfoIFZmYeoMq1IWkU7y5RyU
         UqkI1PH4aYDRKFn72UKeHn4sfKPd1GIYWH8gr13BNhTt1QqCf/fSi5D5YKmHoL4o/pIo
         07VWPyDwZxEWadBBMZLTExh2dTdsigOwRufkSlpnubLgwzJx+JURT5+NTUYUN08NEiGY
         GVfg==
X-Forwarded-Encrypted: i=1; AKwUvBw3K55yO0x3b3x4XQ3kRds6PcywLw162GzMpwjqU2C+anLBHx5nMbbOn2bOOmUGqA4O0c/8mdpLXATcvQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXn65W82ZDyRhC3kVgaB3rFcvn9b8znAO6egVwSf4lJI/tt3w4
	668BugbZSW3nhdsHs/3GFjUJBkKvVbH3VHqPFc6dQEtxLFefFNKgNGIE
X-Gm-Gg: AYBFou0huafmgJR+sCBjP5VrAscFiEGNqHsRhFs07OClMDGe59xwBYbltoKd66SsXwx
	fn09ukIXXCf6RipdjDLuIHRrHL6+GNrrqEn7UnCXSahzMu4RrwmoWiNPgx13skGfdKTWEY/vFd0
	xuqIa47aDEzwtB4HY6+KUS0bBBmP/pdI4/3D4Zeh/O3dWlmWturirmLHA3kK7oVqobT8jHtEcBU
	456mufc/obbLo2DicUz8fRSyd7oEXNZg5NksVRgPLUEDRpGkD7lxHp0AznfT/ducYxR3v2NTxeI
	8YZgAuJatNw6q56YmTrgDpPpIMWdOMbq3J2KI7MoaSUGWsTO/1fSkJ/qjq1hIXlp+AaIAkAxlxC
	4SpQwu4HO9SGqkgdZAh5Te+x2i4FGMhM6GhYQaOzsgq5DtNSpiWu4Fd2fRcVpHVpZG5kNhmUpu2
	19CMZAXEWWcvxQv1vrDuyEDlWaj99tSVN5zyN49oxgs6qxaKLofsXU4yOTyrp9SoO+74jduQGeD
	8M07wu3Eeo=
X-Received: by 2002:a05:7300:7aa1:b0:33e:6714:3945 with SMTP id 5a478bee46e88-361a0898c20mr24289096eec.2.1792510103684;
        Tue, 20 Oct 2026 08:28:23 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm41629029eec.10.2026.10.20.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:28:23 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] ALSA: pci: Kconfig: Fix spelling mistake in help text
Date: Tue, 20 Oct 2026 20:58:15 +0530
Message-ID: <20261020152816.16820-1-sarkarsubhadip604@gmail.com>
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

Fix 'useable' -> 'usable' in the Kconfig help text for
SND_AU8810 and SND_AU8830 (Aureal soundcard drivers).

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 sound/pci/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 6366f72b3..88b88f88c 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -104,7 +104,7 @@ config SND_AU8810
 	  Say Y here to include support for Aureal Advantage soundcards.
 
 	  Supported features: Hardware Mixer, SRC, EQ and SPDIF output.
-	  3D support code is in place, but not yet useable. For more info,
+	  3D support code is in place, but not yet usable. For more info,
 	  email the ALSA developer list, or <mjander@users.sourceforge.net>.
 
 	  To compile this driver as a module, choose M here: the module
@@ -133,7 +133,7 @@ config SND_AU8830
 	  Say Y here to include support for Aureal Vortex 2 soundcards.
 
 	  Supported features: Hardware Mixer, SRC, EQ and SPDIF output.
-	  3D support code is in place, but not yet useable. For more info,
+	  3D support code is in place, but not yet usable. For more info,
 	  email the ALSA developer list, or <mjander@users.sourceforge.net>.
 
 	  To compile this driver as a module, choose M here: the module
-- 
2.43.0

