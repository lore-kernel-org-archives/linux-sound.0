Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDE355F43;
	Sat, 30 May 2026 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174634; cv=pass; b=rMp0Fmb1frGHYwaozrkyNXjx8iOfX1bHTGKsY3mBpt5krIjcMlaCEe6ckueFWiWD9PwvD2ePpHcCFXYWpI07UVhB4cxhpvNwOmD7oB8FugOVg98U3cTEqFZ0HijcbqAx4Aw2yBT7iYtKd0y73dQ5PGIqbmUi59ocCBKCPAlC/sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174634; c=relaxed/simple;
	bh=u32p9CGREL90XuuxAlCy0YRcH9LWIwqjpAIdcAm59Yo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jjjm1Vp9lphHsAJtqISBwKF3oogtC112J2Cv2ZIEB77S08G/P6ok+lQbfsK+YYM8DxQRgQp5gut+0FDOfWWCc+aA0CZJUtNLKKzL0IUL7yJ2OHRnkMeB2uqnynWUz6hgWqXqo1xG8D6nqfKwS/igQ1FsXZIRzoaFYf7LwQvSGI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YNGU/VqL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YNGU/VqL"
ARC-Seal: i=1; a=rsa-sha256; t=1780174622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ID9vxWlz2rO1XTywCf7GPNip4xzB3gD2l+NNth+33j/WFKup9K2lLQP2nyea78nAszaD3rYUOGptX7Jb2pAqB29qDxQsfJ0SO0WJbFO7YsOr6LAuOJl3t0hCd4sBfF3FtvnmR1MtUiLrNYewcPYXfk4FTqK48XBEScebtH80vlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780174622; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uz2RSP3smh/202SsmTwotSV70lBWBo8WqF1eO5VY7d0=; 
	b=DBVoenHV70jAeDifB3MC4Tu5vgak7iDZLGX4UW0xE/RQVqzLz7j/B7ZyzkoEuXB90CRfQB/b7rvd8t3CxIAdxoQYOELzlZSvburAwhLqKVCFyVSzlbKJRNpYPYdb5nT07aEOWwh4BbbUB3aym+0K4Vkheo13qlqwbEMRuJZWI+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780174622;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=uz2RSP3smh/202SsmTwotSV70lBWBo8WqF1eO5VY7d0=;
	b=YNGU/VqLAuaQo0YW3JzukvxfCpkJdGv37U9SqfuosYR25e0U1jWX7KNPNsJPmxMR
	93AjkCsQkCIkckyJ3sA/9sjf2LLFkrh6+TvrP05vSuBHW/3T3UOp0mAOVn1HcPMd8jG
	0vq7zrcQ4O6KdipC9W9clKRH3IjlrfaiZPbUWfFE8eA22zzntLDBSZ+GUfS/yVlR1Cw
	dTQDTs05dRrgdeRWjVqFFQCWXPToI8XBq1PRWGtVes2YGwXjMSinwD1HxmgSD468U2g
	gWNXlTOw1W5rDYaBNZrVITqzh9t6YhYQxDx3eJwsv8oHb0bdDipFvOLyzjtZrq80niS
	ASr4lXmkkA==
Received: by mx.zohomail.com with SMTPS id 1780174619906251.84338091984068;
	Sat, 30 May 2026 13:56:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/2] ALSA: usb-audio: MIXER_GET_CUR_BROKEN related changes
 for 7.2
Date: Sun, 31 May 2026 04:56:42 +0800
Message-Id: <20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAApPG2oC/0WO227DIBAFf8XiuSstSwHjX6nywGVJaes4BduqF
 OXfQy5SH0eanbMX0bgWbmIaLqLyXlpZTh3k2yDipz8dGUrqLEghmiAlbD4Cp5ILV5gzIYJSGN5
 HN/qQjeh358q5/D2aH4cnty18cVzvoZdR+XfrY+tT+9+aBkIyqMk+lrpUv+HIK8Stwr78QMJAj
 qJi68y0q3su+MYQl3kua//cotGEimWIlm0mOxrnxqQVxeSUR0NGS23E4Xq9AZjlJRP+AAAA
X-Change-ID: 23006b11-uac-edifier-mf200-330b4898abf6
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

While the patch to improve the error path of potential sticky mixers
has been submitted against 7.1 [1], this patch series includes
MIXER_GET_CUR_BROKEN related changes for 7.2, as per the previous
discussion [2].

Patch 1 add the quirk flag for Edifier MF200.

Patch 2 add an info message to prompt users how to determime if a mixer
is really sticky.

Link: https://lore.kernel.org/r/20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe [1]
Link: https://lore.kernel.org/r/87ldd1p09p.wl-tiwai@suse.de [2]
Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (2):
      ALSA: usb-audio: Add quirk flag for Edifier MF200
      ALSA: usb-audio: Prompt users to check MIXER_GET_CUR_BROKEN for potential sticky mixers

 sound/usb/mixer.c  | 2 ++
 sound/usb/quirks.c | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 17065203e1bc7e7f2786998d532cd93a06265156
change-id: 23006b11-uac-edifier-mf200-330b4898abf6
prerequisite-change-id: 20260527-uac-quirk-get-cur-vol-d0b292c3e796:v3
prerequisite-patch-id: 71a85de26aa106b9bed45677cef5f305cc135cce
prerequisite-patch-id: c68be851b5e08de9cef4afda7950216b7b960def

Thanks,
Rong

