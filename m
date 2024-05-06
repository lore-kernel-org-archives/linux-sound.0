Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD103155359
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008355; cv=none; b=q0ZEnZ/xLPBrXOr4QkS5lhsmD0MOflfbKC8VVusN86q1JHCPMptVNJ/gi/WOmyddRDRbuP3M7KMKObpFx++xqxG2Mf7wGGhLoRonSv2i6DBUzTObQKiQdkF5YKu96JjIDsphP3rjD1yoPNTfsNI1TONOMq2ZfXJzgigdzWdPGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008355; c=relaxed/simple;
	bh=EaiaH7wqYOj2x7UMiV7cD/L/fQZzSJeSUAL2NRtNxAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7vrLSdUbOpLjpSTwXK1alDOhsbNdaUgLGUCbt4u3pvtMcPleaM/A3XokkVoauKYUcM1cqYf6ef6J/8OsqdFBD+u/U8tX8Fe1rQvIFs6eNKmrxuARsuNRkxTry68URc6D9os2sgEAd9h4muIosvU8PAQFec04QsyY5q1526cbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=TiZPnSqt; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="TiZPnSqt"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A140843F7;
	Mon,  6 May 2024 17:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A140843F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715008346; bh=1dFZZhIU8c4oxcXG5eSbsjW2vfzDqcPdniqiW1qmUvY=;
	h=From:To:Cc:Subject:Date:From;
	b=TiZPnSqtAi8sBLKKZABeITjY8jnI68McsnLTM+Z6Y2VHJuaK6lYgXB36CR9sBoWWp
	 THllHevXzWCrwChwV5bT/OMG4W68B7NxZ5zcU5cdlG9oNT9dhDhxNAdnHKVzNIk4Zy
	 eeaCG/L5gOQZzShMOmTA5F9aLiLevtk/5lvhnYi8=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon,  6 May 2024 17:12:23 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/2] ALSA: pcm: reinvent the stream synchronization ID API
Date: Mon,  6 May 2024 17:11:48 +0200
Message-ID: <20240506151218.377580-1-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
internal command"), there was a possibility to pass information
about the synchronized streams to the user space. The mentioned
commit removed blindly the appropriate code with an irrelevant comment.

The revert may be appropriate, but since this API was lost for several
years without any complains, it's time to improve it. The hardware
parameters may change the used stream clock source (e.g. USB hardware)
so move this synchronization ID to hw_params as read-only field.

It seems that pipewire can benefit from this API (disable adaptive
resampling for perfectly synchronized PCM streams) now.

v1->v2:
  - remove union usage per Takashi's request
  - reduce memory usage
  - use standard ID generation scheme

Jaroslav Kysela (2):
  ALSA: pcm: reinvent the stream synchronization ID API
  ALSA: pcm: optimize and clarify stream sychronization ID API

 include/sound/pcm.h         | 18 ++++++++++++++++--
 include/uapi/sound/asound.h | 13 ++++---------
 sound/core/pcm_lib.c        | 36 ++++++++++++++++++++++++++----------
 sound/core/pcm_native.c     |  6 ++++++
 sound/pci/emu10k1/p16v.c    | 17 ++++++++++++-----
 5 files changed, 64 insertions(+), 26 deletions(-)

-- 
2.43.0

