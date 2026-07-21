Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269B2DECCB;
	Tue, 21 Jul 2026 05:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613507; cv=none; b=Pk/r48pD+51gfAe9s1riTKAXynHmLWCecrY8yc2lZryYDsgQKlFf8g/r0Yh0HEcTubvbb09DRvVtUySYSchyTwRCjSuBOtGg5n/FpSq5+mZPsa0VoJEPwGfzZcI7inHuOhRGrDZ1rJQtdU+cTcFIsj/m6ImdgyKrzmic4cztdZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613507; c=relaxed/simple;
	bh=BTqQ+Wjgf4gTcdCiD9V5GcE17qyLFBU74vYQnCe5xMU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t6GZS3k5jTA7NFeBj9n4QrxsuTLWxgfctwigybMlcLMQLc/VmTJGPg1O7bx5/OCOaQJLGrK1E4Bvlbn0/l9HnwHPJhmhanEeec5b/PlOef+RTVvm7sy5EdESdpLO9ALiB+s1DVi9wYn7jQyzNp1kQU2BlqhyPMNHYCg79VmuVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAC3wT9vCl9qD62RAA--.15825S2;
	Tue, 21 Jul 2026 13:58:07 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] ASoC: clarify deferred component resume error handling
Date: Tue, 21 Jul 2026 13:58:07 +0800
Message-ID: <20260721055807.85110-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3wT9vCl9qD62RAA--.15825S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3WryUZF4UXw4UXFWUurg_yoWrWw4fpF
	Z5K39Yyr1kWFW0vF4vyw48XFyay395GayUtw15G3s0vr98Gr95CF4DtryYvF98Jrn5AwnF
	qr40q39rAF18uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi,

While auditing codec register-cache restore paths, I found a mismatch
between the component resume callback API and its first consumer.

struct snd_soc_component_driver::resume returns int, and many callbacks
perform fallible work such as regcache_sync(). However, the first caller
discards that return value and always clears the suspended flag:

  void snd_soc_component_resume(struct snd_soc_component *component)
  {
          if (component->driver->resume)
                  component->driver->resume(component);
          component->suspended = 0;
  }

The caller is soc_resume_deferred(), which then continues with DAPM
stream resume, digital unmute, the card resume-post callback and the
transition to SNDRV_CTL_POWER_D0. The work runs after snd_soc_resume()
has scheduled it and returned 0 to the PM core.

This is not a recent helper regression. Commit 6ed2597883b1 ("ALSA:
ASoC: Don't block system resume") deliberately moved slow codec resume
I/O to a workqueue. Commit 9a840cbac77a ("ASoC: soc-component: add
snd_soc_component_resume()") preserved the ignored-return behavior when
the helper was introduced. snd_soc_component_suspend() has the same
return-discarding shape, but the concrete sites below are resume paths.

This makes several intuitive per-codec changes incomplete:

- returning a regcache_sync() error does not change caller-visible state;
- returning early can suppress unsafe driver-local IRQ or jack work, but
  the core still publishes the component as resumed;
- powering the codec back down on failure conflicts with the core marking
  it resumed, and no retry is arranged;
- checking only regcache_sync() can miss earlier fallible private-register
  or model-specific restore operations.

I found 33 current component resume implementations with one of these
source-level patterns. This is a count of statically reviewed call sites,
not a claim of 33 independently reproduced user-visible failures.

Return value has no effective consumer (17):

  adau17x1, ak4642, es8316, es8323, nau8540, rt1011, rt1016,
  rt1305, rt1308, rt1318, rt5616, rt5659, rt5660, rt5665,
  rt5668, rt5670 and tlv320aic23.

An early return would only suppress dependent local work (7):

  nau8821, nau8824, nau8825, rt5663, rt5682, rt5682s and wm8978.

Local resource rollback would conflict with resumed core state (3):

  nau8822, rt5640 and rt5677.

The local restore transaction also has earlier unchecked operations (6):

  es8326, es8375, es8389, rt274, rt286 and rt298.

For example, an early return in nau8821 can avoid enabling its IRQ after
a failed cache replay, but the component is still marked resumed. In
nau8822, disabling supplies after replay failure would leave hardware off
while the core continues resume. The RT274/RT286/RT298 paths also restore
private indexed registers through void helpers before the cache replay,
so checking only the final sync would not cover the complete transaction.

Before preparing per-driver patches, what is the intended contract for
component resume failures?

1. Resume is best effort. Drivers should diagnose and recover locally,
   and the callback return type should not imply PM propagation.
2. The core should collect and report component failures while retaining
   best-effort resume behavior.
3. A failed component should remain unavailable until recovery, which
   would require an explicit retry and card-publication design around the
   deferred work.

I am not proposing to make snd_soc_resume() return a component error: it
has already returned before the deferred work runs, and changing that
would undo the historical non-blocking design. I have held the per-codec
changes rather than posting a mechanical series whose returned errors
have no consumer.

If best-effort local handling is intended, I will drop the pure
propagation changes and keep only independently useful state or ordering
fixes. If core reporting or failed-component recovery is preferred, I
can prepare one representative RFC patch before touching the individual
drivers.

Thanks,
Pengpeng

