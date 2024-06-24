Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE913D60A
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234712; cv=none; b=Ba5KRV+kZFL6zSdQyb1Z2RPH4WC7dhH9/ingV+qlW9A+mf6wMa2IpLBeFIKXvAtscrvMYfxeOXlf/iX0i0M9+057qEgAQjvedv+S/mj/3QdyqWjs0OW8bsFsDoFkYMNeTQgBIalDfp5XXJOpU/Ufvorr7A7U7xgvHxDSC5P7Rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234712; c=relaxed/simple;
	bh=+H4mYzHvNXNz1gJcyw0vP6ydIesWV+EgjRzLRz2d40U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgrXRg7GqM/dned3EBdQR75DsN+7WittqjsLWn9Ua2GzSaUldLIsJwaQ/xg1nNCjsABrGrdy/+JCiFKQ0ytsWlgcES0FT1s8RxQBWUyO0HSZnK1hg8t3SEFqLW2T+L+sT31oAJDBBsrj8uB5AAXLNzblzhaR7rBFufCMmfwTzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=zUYsBlgh; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="zUYsBlgh"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2B1A32AAF;
	Mon, 24 Jun 2024 15:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2B1A32AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1719234695; bh=E9KyfMduDUhoUzYEpbqKXuBBKS8feiQ2jn13Tg8/F6U=;
	h=From:To:Cc:Subject:Date:From;
	b=zUYsBlghRH1z7Ghfm2vnslMIEtqhrcYZCPEx1DHB/0dj8kgGApOPtjo5RMaITj3QQ
	 F5a8AOYvRkle2dl8i9hjGIabnJ9Y2sEzWC9TiaKF7+BukNyJd8k6wlLP5VR96ZwxpZ
	 oj743BE8Go2N36SUNueQ1tclHljY0ucY3RbVyr+I=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 24 Jun 2024 15:11:32 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v5 0/2] ALSA: pcm: reinvent the stream synchronization ID API
Date: Mon, 24 Jun 2024 15:07:47 +0200
Message-ID: <20240624131127.498605-1-perex@perex.cz>
X-Mailer: git-send-email 2.45.2
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
    
Note that the contents of ID is not supposed to be used for direct
comparison with a specific byte sequence. The "empty" case is when
all bytes are zero (driver does not offer this information)
and all other cases must be only used for equal comparison among
PCM streams (including different sound cards) if they are using
identical hardware clock.

v4->v5:
  - extend commit message (clarification for ID use) for first patch
  - mark union snd_pcm_sync_id as deprecated
  - do not use get_unaligned() - reviewers are confused and the code
    is removed in the second path (optimization)

v3->v4:
  - more code shuffle as suggested by Takashi
  - remove unused snd_pcm_empty function in the second patch
  - put back snd_pcm_set_sync documentation

v2->v3:
  - fix pcm_sync_empty() function (wrong comparison) [thanks Takashi Sakamoto]
  - more documentation for snd_pcm_set_sync_per_card (ID composition)

v1->v2:
  - remove union usage per Takashi's request
  - reduce memory usage
  - use standard ID generation scheme

Jaroslav Kysela (2):
  ALSA: pcm: reinvent the stream synchronization ID API
  ALSA: pcm: optimize and clarify stream sychronization ID API

 include/sound/pcm.h         | 17 +++++++++++--
 include/uapi/sound/asound.h |  9 ++++---
 sound/core/pcm_lib.c        | 50 +++++++++++++++++++++++++++++--------
 sound/core/pcm_native.c     |  6 +++++
 sound/pci/emu10k1/p16v.c    | 17 +++++++++----
 5 files changed, 78 insertions(+), 21 deletions(-)

-- 
2.45.2

