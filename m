Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0E168A9
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714479033; cv=none; b=t46MPFvWitw6f5DXjnkXianfOslHhw677OeunGRSUunNg+k7hkKu3JCiaMMAnFn6cvIX/QDvPQGQkRlnXEYF46vgFXkDSVQwfD4S+VTCVb40kYPlVs8Dhb77iQrAbzizwc78VzWOWNHxBZoaCJ61OiHkvXDJ574dhjmQEc8Vius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714479033; c=relaxed/simple;
	bh=fjGYOTfQaev/sG7B+dCuEUURcaZ6RPsvq/Kn6R5WNA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRFHYjj7+zRH/vsySFtWmsSLok/nSXlKIcWGkrTOASgsVLgtJBTPJc4lZa5Psa8qlKoC1rVgvRTVucUIuyuQQQ2ePJsFgOdEn+l82yQhgNFTKWuji/w5cyXhyTu6ClbvpDlU9fn4E5fuPpSNacB/tf6MVjb4ePk5S7ldcO6n8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NC7lA5mm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NC7lA5mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=V+732hzn1l15Eh
	TbXn3tkfLxL3DCfbD6/48+e8dQkGs=; b=NC7lA5mmCa8iyeQTDcuyxglnUmYDfO
	e+gXEdceVW1jtNvmiJb7dxHaTlqu6jwVijUEULxJSyu048MoqIRPR2y4ci7aN4Hx
	4xuGqKjg1xdWiXPwNA4pZG9atSmjIaXJsiIJp+XghabDOR4tjCAP+zvsJ9mlnm0c
	eQQseMtXBAIbrdOcfXqcWutpVGY9imomP90dymVPbdKoy4B9cdiU3UQFU2rT4hCt
	p5YDZsun2mHSCzDKjoOTrXcCqi55OIRs81ySfdFSExFC77VqyCOil4JH02XWq/1w
	iIxVnJGhJmzpQeKY9W2y+mmH3eMcI1/OSYoa+ot8KtGhh6prSKaB7oRA==
Received: (qmail 2626393 invoked from network); 30 Apr 2024 14:10:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 14:10:28 +0200
X-UD-Smtp-Session: l3s3148p1@I/N0QU8XZMtehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/1] ALSA: aoa: soundbus: i2sbus: pcm: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:10:27 +0200
Message-ID: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 07df5cc0f2d7..98b812ffbde6 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -255,24 +255,24 @@ static void i2sbus_wait_for_stop(struct i2sbus_dev *i2sdev,
 {
 	unsigned long flags;
 	DECLARE_COMPLETION_ONSTACK(done);
-	long timeout;
+	unsigned long time_left;
 
 	spin_lock_irqsave(&i2sdev->low_lock, flags);
 	if (pi->dbdma_ring.stopping) {
 		pi->stop_completion = &done;
 		spin_unlock_irqrestore(&i2sdev->low_lock, flags);
-		timeout = wait_for_completion_timeout(&done, HZ);
+		time_left = wait_for_completion_timeout(&done, HZ);
 		spin_lock_irqsave(&i2sdev->low_lock, flags);
 		pi->stop_completion = NULL;
-		if (timeout == 0) {
+		if (time_left == 0) {
 			/* timeout expired, stop dbdma forcefully */
 			printk(KERN_ERR "i2sbus_wait_for_stop: timed out\n");
 			/* make sure RUN, PAUSE and S0 bits are cleared */
 			out_le32(&pi->dbdma->control, (RUN | PAUSE | 1) << 16);
 			pi->dbdma_ring.stopping = 0;
-			timeout = 10;
+			time_left = 10;
 			while (in_le32(&pi->dbdma->status) & ACTIVE) {
-				if (--timeout <= 0)
+				if (--time_left <= 0)
 					break;
 				udelay(1);
 			}
-- 
2.43.0

