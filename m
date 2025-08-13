Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D32E2DC0
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093878; cv=none; b=bhMV1ev03a9Bol6ptVWy3D2JRDHGQkAB1S3VVLVg9oOEYy1SCYuzTcBjYOO/4mZ3LYg8w7dzJ/rxR/zZyChyXeMIu0/6NIV7+LJga8pPZv6JikDGcHD7Kolsn+afXv2Xd0gEVgdTvxzz3DQn1PVv2mjjQWQPmWmKSaNDFjlictY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093878; c=relaxed/simple;
	bh=27vgXl9oLpDsbnG8B9JGYHt4LfE1xo9U1LojYvtpczY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueVFrCrOJBgtdWNmuCMASeIaWus6x7+l09Yv56/5KzKkQHYaQjXSU+si8hP5S4pBmh+eiZ+BcW5bGODYT35E6FBCPclkg6m+2LbinEG/hlnNxFQnWJYdlNJfUmAdeELbU5SIQpjBKAQ7ZvWDJEEIZKNmcRmkZH8FP613IMr7rTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQKEAOwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQKEAOwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B53C4CEEB;
	Wed, 13 Aug 2025 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755093877;
	bh=27vgXl9oLpDsbnG8B9JGYHt4LfE1xo9U1LojYvtpczY=;
	h=From:To:Cc:Subject:Date:From;
	b=iQKEAOwokgRLjd8yrKnvdQweOWQrWxwZlVrLWPIRCFgxueC3JxyexZf1XTYYZ8GN0
	 yBCinYbMfjpvFNTyypw9NX6SniD8YWYCRaqMFV3tEmER2qk3CF3MhNZeM7joo2Q+AR
	 tXEEU5wMtay8yPh4bR9IW4tc/Sv6xYSAkrLOHMhtVL230iaq59SAJ4PY9z96fpfe2a
	 PTnfaYICExb9ah0iRti+M4Bxamh5/sQOJG3pCGzxkrOmFCzFJ2MzeVbnkpQITW17NN
	 qKZQueh1zALgrjwBzXp75/WSYatpl+mr+Xup8wXgwqDebpmMgjPFvAJTVugm20Agk7
	 atop8LV/btQtg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Richard Gong <richard.gong@amd.com>,
	Juan Martinez <juan.martinez@amd.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] Revert "ALSA: hda: Add ASRock X670E Taichi to denylist"
Date: Wed, 13 Aug 2025 09:03:08 -0500
Message-ID: <20250813140427.1577172-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a motherboard with an AMD Granite Ridge CPU there is a report
that 3.5mm microphone and headphones aren't working.  In the
log it's observed:

snd_hda_intel 0000:02:00.6: Skipping the device on the denylist

This was because of commit df42ee7e22f03 ("ALSA: hda: Add ASRock
X670E Taichi to denylist").  Reverting this commit allows the
microphone and headphones to work again. As at least some combinations
of this motherboard do have applicable devices, revert so that they
can be probed.

Cc: Richard Gong <richard.gong@amd.com>
Cc: Juan Martinez <juan.martinez@amd.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 sound/hda/controllers/intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index fcf67e97a546a..1bb3ff55b1151 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2077,7 +2077,6 @@ static const struct pci_device_id driver_denylist[] = {
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith II / Strix */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creator */
 	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
-	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1022, 0xd601) }, /* ASRock X670E Taichi */
 	{}
 };
 
-- 
2.43.0

