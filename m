Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C511755C319
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995825; cv=none; b=b0Ckt8MRtYDnkCthBTaEAbAh9raziC4mWs7qd44KCmorHy7rL9iEJH+HvsTaUntrLrrIYph9IdBGMu1vjQHmkWY93h9ovcMuPb7HPuCWcfU1kwHloF0HwUgT9/U4SZNvG2lvJJxEmPCD0gd546euZJhbc6n45asTAS2vAUmxevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995825; c=relaxed/simple;
	bh=BGlZFzZP7pJJnUhvbnFiMKgkN0vfOKzjr82U91HPois=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTxCauOtVm4IEzblm+YaHKVFBG3YR2F0jIswpKADom5aexuxnDlJ6m/jD7nR6PJNOQ6LgMc0v2EmeD2CZ3kLCzL90+sg5h0Gl6sQF0WeXrSHMLYO55cJkalOyrAxbYpSpp3kmxrR4mqEV+LAydI+rYFYX0FfqQuX7MkQJ8zlyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZp3Xniy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZp3Xniy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11883475e9.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995821; x=1792600621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NpJeXoWiltGauK3xjsUlmvznpTS1WruUbIRqkIM6Qg=;
        b=UZp3XniyJPaY3PbfEIx32zDbTVqPSyB472iPhD7++2EHK8cqZ1fPqk0CEcxogs6iuU
         /MnIVEwhsxryHKEM0tjS7oxnVviOsrExqKp/Vb2o1bhaOpSKAVleTzAzI69mbAYY4frB
         rox/7G/h37bGOlcQQP3m6IYjY046ssLpXoWqFUZYcLxc62nUr+QMkyeAz/VrcpgbKGTE
         Sri8to6/D9fJGxA3KDvz2RKV4IjkY2nuBoSSyA+4urOAEqdsvnNZThpkWawceuWKPg/8
         ikE474w981Q5XzGlnp7WdnUltF8iwmWtHPETQFtlEa7ZfaWiFAfS3j2pFX8MHL8NItym
         mgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995821; x=1792600621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NpJeXoWiltGauK3xjsUlmvznpTS1WruUbIRqkIM6Qg=;
        b=lWeoc7F1iMN2RJOWPqmB83YjUIsASr4AzpDLqwHgSXK/awjwSeEeEuD5UA9KhA2vYb
         rzOj0KpuoVX8VWsBlBgzRE9WF3ncRHEOdZKW/kac8EFqWH2yROlqyRExEbkH0XhGErU7
         eWpkgESvItnoib9NarGRzqlIKH5DqLTxkwVfn7EfXuVJSVM9dZ6CnS7YRN/RmAZ/a3MA
         y9/3uqmqSXnkduFx0K6W3xkW5YGGY0RRo4d1CWeCBNcpxaww4pIOzxDcTHJEKa4/LGDk
         Nx/1sxsP2/iJwK23jEhlhNa/GOVlaeoWZSCLl43oRlmWVbK3t9/9JR0QtygJLH8rKMdJ
         aJjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY1zUXmPMXHtQddRj0B55LKZQ0+NxRXoWqLuIAyXDzOvWSkNPVFw2BXZWokewdg16zHUucXV9IYCaAVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLlQABQHNpraOSztLKwFl0IR3jLql1iTcfinyApsxy9X6ISV4de
	bPE1pkP3yi12tnqq1xX9qqv3+UuoB022rdlB40LTH4UHrGQ2PS7Icre6
X-Gm-Gg: AYBFou1xexy1/e41LjPMGXGNgrN+YmeG5J9/nGHPNGlPe1DfH2E5B3DKqQ1QXmIREcO
	3AcdOObej1wbauKbLgKpUU5aqubVAD2z8vt9nDqv4HP8bVoCGsTszSQgVC1hLVLHzktEfYAI/d7
	YA5LF2bFYZ0uEgP4pM57REFlvoPKqheL/etvZ8P8GhV8wyefBeyCE9FXn1JC3uQ166tL55aXpMf
	/PxNZW8s5VVM2v9Xyb5Z4Dm+wokY14s3hgOOkNyy5MkHZOIdEgT1kM09noRlXyZ4rZVU1tv7sU8
	UfLlKfEm0gDk2GSHSo+LGqwT4jgJ7PQJHyFLjOZi8KawgxbcPS4RYHcGojRLh7qaAUnAdyXoA2q
	QZMFTGBhWcxno/QposBh3SwrA2AbX8IFuTVzuvgoPExTTTAeOHCaXnrIU6PVN57UO8K85mBgD3i
	QYvh1P50Lkh69h+yDgKlMSNrqgZcMZMeSGKjmv1WYEt5HHDzCJUFbl2yYUJzsjPNBhckKvssZbA
	5OsNmNIszGmJWaOD5AY07SeWA==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr321640615e9.33.1791995820826;
        Wed, 14 Oct 2026 09:37:00 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm16828341f8f.49.2026.10.14.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:37:00 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Val Packett <val@packett.cool>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] ASoC: codecs: aw88261: start the amplifier on unmute at trigger time
Date: Wed, 14 Oct 2026 19:36:49 +0300
Message-ID: <20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amplifier is started from the PRE_PMU event of its AIF widget, that
is from DAPM in prepare. aw88261_dev_start() then waits up to 20 ms for
the PLL to lock to the bit clock and powers the amplifier down again if
it does not.

Not every host runs the bit clock by then. The Qualcomm AudioReach
backends only start their graph, and with it the I2S/TDM clocks, in
trigger since commit b54a38af7138 ("ASoC: qcom: q6apm-lpass-dai: move
graph start to trigger"). There every start fails with "start failure
(-1)" and the speaker stays silent for the whole stream, as seen with
six AW88261 on a TDM link of SM8750. The asynchronous start removed by
commit caea99ac809d ("ASoC: codecs: aw88261: remove async start") only
hid this when the trigger came soon enough.

Start the amplifier from .mute_stream instead and set
.mute_unmute_on_trigger, as wsa883x and wsa884x do. The unmute is then
called from snd_soc_pcm_dai_trigger() after the CPU DAI of the link,
so the bit clock runs when the PLL is checked, whatever the host does
in prepare. Hosts that start the clock in prepare (q6afe on the
Fairphone 5) only see the amplifier start at trigger instead. An
amplifier that already runs is just muted and unmuted, and powering it
down is left to POST_PMD as before.

A stream that is prepared but never started, as sound servers do when
they probe a device, now leaves the amplifier off, so POST_PMD finding
it off is expected: make "already power off" a debug message.

The trigger has to be nonatomic for the I2C accesses, which the
Qualcomm DPCM links using this codec are.

Tested on a OnePlus Pad 3 (SM8750, six AW88261 on two I2C buses, TDM
from the AudioReach DSP), with PipeWire and with a plain ALSA test
program:
 - no "start failure" at all, where there were six for each prepare
   before, including the probes of PipeWire;
 - SYSST reads 0x0311 (running) on all six amplifiers during playback,
   also after three PipeWire restarts, and 0x0000 when idle and after
   a prepare without trigger;
 - the write that starts the stream, which includes the start of the
   AudioReach graph and of the six amplifiers, takes 52 to 71 ms
   (six runs);
 - listening: every sound is complete from its start, including the
   first one after the device was closed, without clicks or
   distortion.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
This is the codec-side alternative to the RFC "ASoC: qcom:
q6apm-lpass-dais: start the graph at prepare" by Jorijn van der Graaf
[1]: it leaves q6apm alone, so the DP case that RFC breaks is not
touched. On SM8750 with TDM the PRM IBIT vote of the MI2S clock control
series does not get the bit clock to the pins before the graph starts
either, as Jorijn and Srinivas saw on FP6 and VENTUNO Q.

Luca, Jorijn: could you give it a try on the Fairphone 5 (q6afe, the
clock runs from prepare, so only the start moves to trigger) and the
Fairphone 6 (q6apm, where it should replace the RFC)? A Tested-by from
either would help a lot.

Testing was done with the same change on a v7.3-rc5 based tree that
also carries other aw88261 changes not upstream yet (a battery
monitor); the mute_stream part is the same as here. I have no number
for the graph start alone, so the 52 to 71 ms above are graph start
plus six amplifier starts, on two buses one after the other.

That time is now spent in trigger. A program that starts the stream on
its first 10 ms period (start_threshold of one period) underruns right
away, as the buffer has drained by the time the trigger returns.
PipeWire, which fills the buffer before it starts, saw no xrun in a
60 s tone and in the listening tests. I did not make the start
asynchronous again, as caea99ac809d removed exactly that; if the time
matters, the start of each amplifier could be made shorter in a
follow-up.

Federico Amedeo Izzo's "ASoC: codecs: aw88261: expose hardware mute
control" [2] may conflict textually; aw88261_mute_stream() already
honours mute_st.

The analysis, the change and this text were drafted with an AI
assistant (Claude, see Assisted-by); I reviewed them and ran the tests
above.

[1] https://lore.kernel.org/r/20260705033830.305907-1-jorijnvdgraaf@catcrafts.net
[2] https://lore.kernel.org/r/20261010-aw88261-hardware-mute-v1-1-d0befedd3b4c@izzo.pro

 sound/soc/codecs/aw88261.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 8671069f4c18..fefb77d29449 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -563,7 +563,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 static int aw88261_dev_stop(struct aw_device *aw_dev)
 {
 	if (aw_dev->status == AW88261_DEV_PW_OFF) {
-		dev_info(aw_dev->dev, "already power off");
+		dev_dbg(aw_dev->dev, "already power off");
 		return 0;
 	}
 
@@ -865,10 +865,36 @@ static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int aw88261_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(dai->component);
+	struct aw_device *aw_dev = aw88261->aw_pa;
+
+	guard(mutex)(&aw88261->lock);
+
+	if (mute) {
+		if (aw_dev->status == AW88261_DEV_PW_ON)
+			aw88261_dev_mute(aw_dev, true);
+	} else if (aw_dev->status != AW88261_DEV_PW_ON) {
+		/*
+		 * The PLL locks to the bit clock, which some hosts only start
+		 * in their trigger: start the amplifier now, after them.
+		 */
+		aw88261_start(aw88261);
+	} else if (!aw88261->mute_st) {
+		aw88261_dev_mute(aw_dev, false);
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops aw88261_dai_ops = {
 	.set_fmt = aw88261_set_fmt,
 	.hw_params = aw88261_hw_params,
 	.set_tdm_slot = aw88261_set_tdm_slot,
+	.mute_stream = aw88261_mute_stream,
+	.mute_unmute_on_trigger = true,
+	.no_capture_mute = 1,
 };
 
 static struct snd_soc_dai_driver aw88261_dai[] = {
@@ -1038,9 +1064,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 
 	guard(mutex)(&aw88261->lock);
 	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		aw88261_start(aw88261);
-		break;
 	case SND_SOC_DAPM_POST_PMD:
 		aw88261_dev_stop(aw88261->aw_pa);
 		break;
@@ -1055,7 +1078,7 @@ static const struct snd_soc_dapm_widget aw88261_dapm_widgets[] = {
 	 /* playback */
 	SND_SOC_DAPM_AIF_IN_E("AIF_RX", "Speaker_Playback", 0, 0, 0, 0,
 					aw88261_playback_event,
-					SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+					SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_OUTPUT("DAC Output"),
 
 	/* capture */

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6
-- 
2.43.0

