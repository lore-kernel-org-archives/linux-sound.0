Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A511474A4
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070754; cv=none; b=nVyFHHTO7m4HEv4bHXqBSTFmM6Y+3/FkhUojDZVzkDngsloNtTTcFx5H/SCqTuMpQVP97QiU9ceH6jJP7dO2o7nDGzqnqT7Znr458nY+jmPFIPl/1pg7KlyvL2tHpl1J2OhOhiiae2IqhOTBFMEVZUR4Szp3HONI4LZWOerlOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070754; c=relaxed/simple;
	bh=+zVizjnrn0IpemD/WT4PYhTCGU8FNn6QDKoAnkrdWrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5MkRM3BfhD3V7E7E3WQScQCtwiKiMItzVA+d8QpSfIBkPuttZNLbXgsW0QgrmTGefDgI9Y0H5TtDvTttEV5NFGsMBCMIaATEj1w8yz2pXV0mf4YOoavu0oLj72MguH2dAtJ8gda0L40ZpBDwe/TZlYJRwzWq5tN8p+FXiOqV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=H8OHEFjA; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="H8OHEFjA"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90FC31DBB;
	Tue,  7 May 2024 10:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90FC31DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715070741; bh=PcLivII1jCxbqZyhc+INXZdst5UFJFk219uq21y3rOg=;
	h=From:To:Cc:Subject:Date:From;
	b=H8OHEFjAQmnFRm8rA6AMR4AeMEsJzuMZjw8YmsI134WUbZPa5pAo3KejGqdjwV+t6
	 gBAIJEtsHHJ4wSpYSDWz9asfSCqWGhZo3sA3sfOnh3GyWrPWUwHswtRzx5I8kWKA1b
	 qPSpUYMY+qxU4Mmk7upyiDiHildyKWLFvyY21p7s=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  7 May 2024 10:32:18 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 0/2] ALSA: pcm: reinvent the stream synchronization ID API
Date: Tue,  7 May 2024 10:26:17 +0200
Message-ID: <20240507083142.557299-1-perex@perex.cz>
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

 include/sound/pcm.h         | 19 ++++++++++++--
 include/uapi/sound/asound.h | 13 +++-------
 sound/core/pcm_lib.c        | 50 +++++++++++++++++++++++++++++--------
 sound/core/pcm_native.c     |  6 +++++
 sound/pci/emu10k1/p16v.c    | 17 +++++++++----
 5 files changed, 79 insertions(+), 26 deletions(-)

-- 
2.43.0

