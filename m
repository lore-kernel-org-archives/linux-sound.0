Received: from cvsmtppost102.wmail.worksmobile.com (cvsmtppost102.wmail.worksmobile.com [125.209.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DED30595C
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.209.209.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847884; cv=none; b=e7izbXT9JI5FtCQGz3Fixlq9AXouiC2kJ6reUTQajKgsazIgNCg5xi3LIQlyIL/eY3Y//QiUtp+VMQy0mHv2wkJk77Vup4Om/ox8plRp4MtP4weNTy3m0fys8WlK8bJGl220Hf223qe5i9Foi0mSE0E5ImxodNvqvsvy7FYFZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847884; c=relaxed/simple;
	bh=xq4ErUHMgGSCgW43+xQhyQpu9SGL2isHfw4lEubd5Sc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FYLseL2pJK7N07gwlpGgAazeSxzHq/abVlILk00uU58YVWvl2pdv1MFU98OYjzt2itIchxvtq+XOCKYr/flu3NDLjQ4OmZrQclA+RnjWc6rgptGux6oyMsneA+I8Ra/bpXtlDl4tO9MjTOjoeXLfWb1yEt4+AzvFrMGl/rXAf0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=mWP92Gcp; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=dbyW3ZiC; arc=none smtp.client-ip=125.209.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b="mWP92Gcp";
	dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="dbyW3ZiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1769847273;
	bh=xq4ErUHMgGSCgW43+xQhyQpu9SGL2isHfw4lEubd5Sc=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=mWP92GcpJkjk2dS+fWh6CRJ4A7iOFY5DVc/VER8YoN93DDcNt8OnkgKG4BdCGtV9U
	 lDMwWJIao1vQp5fbWVopUrjlxYzhwegklxaxpS/r5A1WIyWAk2YfBTJHIfYflZYIie
	 DnbqCkNnd1WG82XlSrHvwGbZmP+8voTpVlu7xfGiBwRuQkLciQT+v0qmBn/ERF0j+d
	 Gj0xT95DOI9FXKG6TIWB2xs19xwhfnIEzGw0AkZ5c2eSYfKCCM9oNfD4H8vNDo0oBw
	 BVgDCcQpC8DSIikMbDLnX4Z0kI2AMPgtf19oNppfUiBGD/TqULMOLI0vDl5Frx60Xu
	 PBhwgLT4cfrEA==
Received: from cvsendbo006.wmail ([10.112.11.111])
  by cvsmtppost102.wmail.worksmobile.com with ESMTP id VxC9uciWQR2P5yaigtdciw
  for <linux-sound@vger.kernel.org>;
  Sat, 31 Jan 2026 08:14:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1769847273;
	bh=xq4ErUHMgGSCgW43+xQhyQpu9SGL2isHfw4lEubd5Sc=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=dbyW3ZiC7K1kCnRfuzWN1zLvDkpazazSW4t0SkLYkQeg8hsd2eacWSfsI9wxKqT/o
	 WuLZy0ahQtW5fUGi43SnLQI4F6t535YdakBPHGi89rW6QnREX4n0JluVhFb1KtTuBl
	 c6X9cDe8jQNRTkBCRXbi5cFciftq2mkPRsc7laVU=
X-Session-ID: yk6IVAozTK++C7rO5jUXdQ
X-Works-Send-Opt: EenqjAJYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: gdbwaAvrFqJZ+HmZFq2d+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp403.gwmail.worksmobile.com with ESMTP id yk6IVAozTK++C7rO5jUXdQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 08:14:32 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [Question] Dead code in ALSA drivers - functions always returning 0?
Date: Sat, 31 Jan 2026 17:14:31 +0900
Message-Id: <20260131081431.2920839-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I noticed several ALSA driver functions that always return 0, but their
return values are still checked by callers. I wanted to ask whether
these are intentional defensive coding or could be cleaned up.

1. sound/isa/cs423x/cs4236.c - snd_cs423x_pnp_init_mpu()
   This function handles pnp_activate_dev() failure internally by
   setting mpu_port[dev] = SNDRV_AUTO_PORT, then always returns 0.
   The caller checks "< 0" which can never be true.

2. sound/pci/ice1712/ice1712.c - snd_ice1712_chip_init()
   Always returns 0. Callers check "< 0" in snd_ice1712_create()
   and the PM resume path.

3. sound/pci/ice1712/ice1724.c - snd_vt1724_chip_init()
   Always returns 0. Similar pattern to ice1712.

4. sound/pci/vx222/vx222_ops.c - put_xilinx_data()
   Always returns 0. Caller vx2_load_xilinx_binary() checks "< 0".

Are these intentional for potential future error handling, or could
the return value checks be removed?

Thanks,
Ingyu Jang
