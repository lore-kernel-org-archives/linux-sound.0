Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7250B15B13C
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715088966; cv=none; b=Rx7LPVso4coBDdBhjxvvPLUrIqSw5z+38VC9a47NYG7CFvxjC/z3svQxRf/srARLJJn1SWZWhkNUWpzbdroiETiZS8oKsRZ9Xo+NukHdop+HrWZDVWBPkQH7AqZYQBkjQUvGM+CT+b6VzNk7Y/6aHBa8t9SnfD5Yp/mR587JEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715088966; c=relaxed/simple;
	bh=ZpwGFgBbKfKTpmuVAm+MwzcQiwwoO43Acx61ECQyLYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEvrm47yWSgdHI+YgT72MdH08SU9H4WVkPNYOrIyxiLNIlfLg+h2+wQiYEtRX+JWWYvwc0kLdj+vmEi5+9p376xV88Hib/qYfbYarRmRydmlQxrwQPmpo6+8OBfcHZ2THC1nfc0ylFjzeIlrBP9omGy41pXjBkgy+yFlShsvS/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=X4v3rxRs; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="X4v3rxRs"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0AC311DBB;
	Tue,  7 May 2024 15:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0AC311DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715088959; bh=3yRoa4emOI2qInrfPy3YqT3J3GVXsgpxMetLorzdE8A=;
	h=From:To:Cc:Subject:Date:From;
	b=X4v3rxRsnHjQuKEqT6qjQ/5t5W0vmuHjOn2600goHnAKONG+2qQcgfm1y+wAWz4qF
	 hg2V1ZIEiTUt/iHI20YNZ90lLfcnI+qO2YuAzXTmRtdM/c6lLxBbAvp9P7w2s2GJDQ
	 Trn+QMPV9OBJgocFWPrWl/lVlo3r5+GX5o6qsZ4I=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  7 May 2024 15:35:56 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v4 0/2] ALSA: pcm: reinvent the stream synchronization ID API
Date: Tue,  7 May 2024 15:30:49 +0200
Message-ID: <20240507133551.607171-1-perex@perex.cz>
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
 include/uapi/sound/asound.h | 13 +++-------
 sound/core/pcm_lib.c        | 50 +++++++++++++++++++++++++++++--------
 sound/core/pcm_native.c     |  6 +++++
 sound/pci/emu10k1/p16v.c    | 17 +++++++++----
 5 files changed, 77 insertions(+), 26 deletions(-)

-- 
2.43.0

