Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A963DA5B3;
	Tue, 31 Mar 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971328; cv=pass; b=D1odb4vN81Vlz5xLGjuWlyz2P6zK4xH25XBlM794QxmpqL/iHRS+XVx5hDt3LdeLWqY4O1twUoOmoSveARuPvzr+zYUbwrD33EkUHsbdxTmMJuKaTce9UKZ1wUSCcKMdTZT+KR4LomBQ6eQTBTAotso3TlJVdo7j4jb0f9QJlmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971328; c=relaxed/simple;
	bh=TLWySdiJjdrUJpRxTBtC/CUWMUkKEz8L1frGZaPN/Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEmtuqW3w5b+Gw82dA8BcoJXEar42JNFNiS81Ra5Mxts5ntzxgyc1oGpQ1WNFztvP+cWPuTS8tF3/jWjFj9d1e3v6CjXGE3/ktXrW2XKq3JtK03SyZ6+brUqUHl7j2LIM0Tt+OBbc30DJVF7YcqtWSRezcIfTEE5SBX2H7sw1S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=R+rbXE6d; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="R+rbXE6d"
ARC-Seal: i=1; a=rsa-sha256; t=1774971316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LT0Q0mfykXQQP/UC5sxm5H28i0dao6hF4d34RqF3azjAF30L4NRxI55bpY0pEbywoc/INDnd2YT6sLs5TwWLJlvMJSepSVAnXqWDAXSEorrS3dCryuDPoxgPqHFfuHI2a0Jen5cywdRMsFMn7UOXhJT2qWPqxIj2l7BLZbKCO0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774971316; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w1kKJz2OsE4WQd2euufbXlGCYwmAS5gVkrnUHqtBZX4=; 
	b=VyNaHUkAK5Tgv/FI81Qsp9bGQQFRn6tTDQNRLdi0xNz+TJu9GcWmeyXR6PngOFDZku7gQeiexlTroJhURkwD1I6+OmPUBS12zDKxPliMIK5vKNbLbbT4ZC5MQr1LjUeK5Y89FruIsq64/Siehi9YIJ/SZSO5bMQRg8MpU6LNHqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774971315;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w1kKJz2OsE4WQd2euufbXlGCYwmAS5gVkrnUHqtBZX4=;
	b=R+rbXE6djph4sI7syNTiSIaBGqkQ5xeDSlXhB3SyVLojwL8yDE1SkUoCzmowfEf2
	KeO4pyAckQeqdQgi5MSRUaObyzK9yJ8I4Lus9at48QGNTe/fRz8c0+99DVQ1WS+LhUg
	beZ8bUw6p8bp/TWH2AyJz1M3P4Za8xh6jjyHTb2O5B3aVcOfQCtgZ6msFBFyKELDtY7
	XO0X4n35eUdJka+3IfwHXXmmOylTqFqPT/gZ50BHH9glRu6gXdeDlb5NE2G3EEaW4HF
	/d/wnca+WVp7fQQn2KuAmlLWFA2BouIPzNHjOaEslNig9kXz7rz6yns0TbWz3vR6UMR
	0uj/yBXpQA==
Received: by mx.zohomail.com with SMTPS id 1774971312419215.4400381255016;
	Tue, 31 Mar 2026 08:35:12 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 0/3] ALSA: ctxfi: Clean up DAIO resource allocation
Date: Wed,  1 Apr 2026 00:35:04 +0900
Message-ID: <20260331153507.2934795-1-me@harin.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Clean up the resource allocation in atc_get_resources() and related
functions, on top of the recent SPDIFI1 fixes.

The earlier refactoring introduced a kernel crash on hw20k2, where
daio_device_index() returned -EINVAL for the SPDIFI1 type and the
value was used as an unsigned array offset. On my development system
(64G memory), this did not manifest as a crash, making the bug
difficult to catch during testing.

Tested on the real hw20k2 hardware with mem=8G to verify the original
crash and confirm these patches.

Harin Lee (3):
  ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
  ALSA: ctxfi: Use matching DAIO type for da_desc
  ALSA: ctxfi: Precompute SRC allocation loop bound

 sound/pci/ctxfi/ctatc.c  | 27 ++++++++++++---------------
 sound/pci/ctxfi/ctdaio.c |  5 ++---
 sound/pci/ctxfi/ctdaio.h |  2 +-
 3 files changed, 15 insertions(+), 19 deletions(-)

-- 
2.53.0

