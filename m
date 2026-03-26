Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671537F740;
	Thu, 26 Mar 2026 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536785; cv=none; b=foYOhnDg2bGwWCgS39sHlH3mFvU6SygOupCjN3DqtGwvVER8inPBiIr9b+ZZ9GKiY4wjBHhRmd1/rT8d6etrcLaqvDLeA9LtADBq3KsGb/4Q6w4Pl8pxN1cjLPH4PNupk+PMjNbPyFV2aht4rvtwAgjhGUBby3pP9tOIlFKPZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536785; c=relaxed/simple;
	bh=BbE3pnLrgm/wPzHHV+H7hYNU7JsNB1SS4D82ehKfwr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RfhH15RMYaqVhA8xA2UwYOR445Rt6mRiogzjP1/TvORMC1db/URQajOAwhleoB01wfzZlkTqLwkHUJ3xVhnQSfdU1zji1kCjidhUjEW3hDaDAIno6Z7iOC8I9qntB7FEchLq7eLW4fryoERnTXbYVE28TeufPlEbafCfALYVovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiFiBoYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiFiBoYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F7AC116C6;
	Thu, 26 Mar 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536785;
	bh=BbE3pnLrgm/wPzHHV+H7hYNU7JsNB1SS4D82ehKfwr8=;
	h=From:Date:Subject:To:Cc:From;
	b=tiFiBoYOA1nR5g3RTUHeYil1I7WXH6mmyynqWtfKpBjCagxAjws56TVAOlvET6wEp
	 UkJG0pVz1vU//M5X+YEdk0BNCHO6czOoyN+oGXDREL10QK/Rd+78XR4vX1VC9CeOpA
	 Wnr8jXaPurItSYPzuO//V8+LUDCd39NFmJ5stPA/ANEADWV63QjmityyhA+YSMHxGE
	 q2hR8+N9MpN2uDi9hKgAEIXrFSx/JB6/EdvkD4jhhtk7oqQkXkvJkCqqAYI/Xi325V
	 C7Hd/zHKwULGpDQauVptTXTqL7j/iOKFzWx7QQ5JQX45vEtJukymO8NkXfzWQ5DpDa
	 ku8CcD0U5x7hg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Mar 2026 14:52:41 +0000
Subject: [PATCH] ASoC: SOF: Don't allow pointer operations on unconfigured
 streams
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-asoc-compress-tstamp-params-v1-1-3dc735b3d599@kernel.org>
X-B4-Tracking: v=1; b=H4sIADhIxWkC/yXMTQoCMQxA4asMWRuYZrD+XEVcxJpqhE5LU0UY5
 u5WXX7weAuYVBWD47BAlZea5rnDbQYId55vgnrtBhrJjxN5ZMsBQ06lihk2a5wKFq6cDOng47S
 PbktuB/3Qm6jv3/10/tuel4eE9l3Cun4AulSQyX8AAAA=
X-Change-ID: 20260326-asoc-compress-tstamp-params-296f38f15217
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Paul Olaru <paul.olaru@oss.nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BbE3pnLrgm/wPzHHV+H7hYNU7JsNB1SS4D82ehKfwr8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxUhNdRwhXc6y9aG+65srowNcrVX57YRFUDXSp
 QLexIzjmmGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVITQAKCRAk1otyXVSH
 0JEqCACCBaRx35mm3EhKMvktkcl9acJ6OBb8bPnXAFUcGm0p6Kp6q+GPFa1nA/W/I8JD2+ZJiE1
 VzHgE35CieKBbnqt8Vbl+ck8a06GDGIX7DRN2CfeA2riCMHZY/n/XBVsi3dmSgj6lXtaji/FVkC
 S03/qjR2W0Wig25pwEWoO5xY3OFhvcG9q4UiM9dNwOftlnTXtckaqA9PTiMkX68lEEbZYwKk+hM
 E0KQtcu/LP4FeXE6j0Y/uWsra2yjf8CoX2waUU5ZmgqFKnjAF71WZ8TEpGRv+/8gwT3034M2bAl
 RUF4QytlVufVz0L40DNJhDy1TaZATLMcwn3MnWMFBsAknWhO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When reporting the pointer for a compressed stream we report the current
I/O frame position by dividing the position by the number of channels
multiplied by the number of container bytes. These values default to 0 and
are only configured as part of setting the stream parameters so this allows
a divide by zero to be configured. Validate that they are non zero,
returning an error if not

Fixes: c1a731c71359 ("ASoC: SOF: compress: Add support for computing timestamps")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/sof/compress.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 96570121aae0..90f056eae1c3 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -379,6 +379,9 @@ static int sof_compr_pointer(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
+	if (!sstream->channels || !sstream->sample_container_bytes)
+		return -EBUSY;
+
 	tstamp->sampling_rate = sstream->sampling_rate;
 	tstamp->copied_total = sstream->copied_total;
 	tstamp->pcm_io_frames = div_u64(spcm->stream[cstream->direction].posn.dai_posn,

---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260326-asoc-compress-tstamp-params-296f38f15217

Best regards,
--  
Mark Brown <broonie@kernel.org>

