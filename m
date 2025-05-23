Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBB420FAB9
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026120; cv=none; b=WSJ6oKuyf8Qcco4M05DE4gHpL4Litpywol5Z9KIfIPuZwiqKgRAHRsFfSOfvN1WuwmVoIyXrWLgENRCXHVpSTSSeGsEEF7qCHaei2G1o44L27qkZliS9YrrELTl9sq9qdKz9SG6zp68i+rU3/i/d+4D0mS0qLD141VX+CbmJQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026120; c=relaxed/simple;
	bh=q5werA8oZR/lvWXiODvARswfiHp7T2MImauES3iFgEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpglIUaeSfIwClz7J+rTi/JmJnkDy7DRXf6uLG5FtF+4+yDg5i3Dbfx7AUiG8SCz6FQHmzQpQiYe6ygF9GYcra3PUK5FT3qGbqT72V3VUQEDstRSM1KRfuCoVYgkITViE6vgPvyzBMmCqElMdX5Z1F5X2B9Gz0AD7EN3iHh7HnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqpPFJ1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqpPFJ1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E49C4CEE9;
	Fri, 23 May 2025 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748026119;
	bh=q5werA8oZR/lvWXiODvARswfiHp7T2MImauES3iFgEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QqpPFJ1l9QdKWSO95BEuo1CGSVQKPHjDYif84bWQgBzK+kB7viTfybVwp7pp8KcW6
	 6ZX8DQjaBse/SOjsnmaMElqn03vOAQHh1KGXZPb1kXjct4KO+g0id3P886Ay3js07J
	 MVIRDopc5zy5MaqiJwEfQbEbtH67O7Zw2NSfPjxCfSkN+8WnSEwKVSNzPF7WgVB5qk
	 PhoR4l1NNZrKOTb472XbE6MT61AP/s55/1wbLxu0WyovHJ2e6IFwqeSVItsiFh+zsV
	 lSrkOAruXOLnt+o3z9USN9ytRX+vr5GV2g9aCYWvnNeB+PJ0BbrOPIgnACynWrXBye
	 yMHM7QH5uHq9g==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Decrease level of 'cannot get freq at ep' message
Date: Fri, 23 May 2025 13:48:16 -0500
Message-ID: <20250523184829.1099198-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Not all USB audio devices support reading the sample rate from a
control message.  For the audio controller in Lenovo Thinkpad Thunderbolt
3 dock this message is emitted multiple times.

As this is expected behavior for some devices, decrease the message
to debug.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/usb/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 842ba5b801eae..521d8733bce5c 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -498,7 +498,7 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8,
 			      fmt->endpoint, data, sizeof(data));
 	if (err < 0) {
-		dev_err(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
+		dev_dbg(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
 			fmt->iface, fmt->altsetting, fmt->endpoint);
 		chip->sample_rate_read_error++;
 		return 0; /* some devices don't support reading */
-- 
2.43.0

