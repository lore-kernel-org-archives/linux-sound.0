Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108097;
	b=mr4VAjWtCO+ekEK5erDPWt6BW1HXcHgxbOEYfb8n/w7UuAW5O2ukveogxoL3zZqx6SoS
	 crZN2YZPQa1C+/sVihrQQhNy4Z0PB2g5o1EoEKDjyOKvBlt3tgAtaNRAfAGzTSzdPPp2J
	 ucnobsz2D7/bZtqi1prQT98TGVd31LvfidJobg9UhLDvoZc1bZINlex3dda3ypshlCC9I
	 MkuaYtMJiiZ4RZcuWM/Cisc5wIDJNCTfU5NzIn8/NGMO4ScoRWnKg4pz7/b2YAyZpPyCZ
	 iy6ixFOD5rpfXA6za8EflRdYycn3MXGJNC78oHZ695ZJVrKKCr072tC9VwCipP5rp+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
	b=zV6PY7iLZpDUjByEVbxL6EcmkbMReu0AaiSqdrNxNGV99PsRms7u/I5janCl4vrpqOXP
	 setQrJARBjMq1tbBkrL4r2oOlOVl6dUWeN+MNadZ+VobAHdXGlNPlp9q7vWOAV93RqqIi
	 PROqrGwk9uuTaM95bSFIAtWwrVBCZ8esjPuee19BeF0R3U/LkZ/tRTlBRl2R2fyhti4d3
	 l0mu5/qCSBsEIVnjBvP9w0cjEVv7iOvyicbz+tqw85KLiG9LhjAplswLNeYnEr1fQfjE9
	 efLg2kmsICeabv3e8QnDNlx6AklTRLMAYTGRzMdWtPxKOb7MruNgyj0iSn0a04cX6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="gGHa/39Q";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADF60A2619
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ADF60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gGHa/39Q
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso1419306eec.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108096; x=1795712896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=gGHa/39QLPyCZ0RgBw8vLO5i2C5OU6Vs5rt36RyPTS8CI5ngk6cAVvKkALlvpa/ofA
         Dnjs++Lua8gLy2tHZtZTr0Pm3F0+C0wwo1MGF3Ltl5KkT3rj7USwYH83D3TSxUfAoFFS
         N9Ud74nfr5Fz3yGmOvqmK0D5QyCWlPfb4vOfKl7ONEg4lzdFnRy7nMEOAZy3nNy+6JUy
         fVbf5+AvdE/Lyko8jMwJJEASxjpuP+Vpu1SoV1hKXqfXrTz2OknoW6GnTuT1JnCiOskN
         Epusush5r3HXOLZfw6vCBurVNfGslL8BRMvFsSp9EkZsZHnz9EX+OvacpaBMVTcEwHI8
         cbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108096; x=1795712896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=zfD0v1MSnOifKJy/vsXv8spkEgQ9p3RCpgGFMUGZ3bbvfJ/dpdNkJSAD7Wt5FyZe7z
         ++YJVDQ1UKVLKXjxZGnVnoL6/qLzBTq2IaGFQm/cwWKjef6R2nst3KZyTPiarGNm3+IP
         oJN6oJlCAnqI052+FQfVuodseca+tyBRvT7tTwdGDm0jMJruLzq2WkkWdu0kX2BZFeJs
         EPxmOR6mdCFKhQ+KntEgJOJKApiV8zdlpUh2JyG3gmN4pChDnhXFns0ORnBAQTNTP3Dc
         jGN4cTwtphXkytAjyFm4DNF3n9OiIdH2BPvdE5/1iZhC6htZdaGpLHcnpgcgxrbx+bfX
         IumQ==
X-Gm-Message-State: APuU4Z9noKrj5egn6iKmIoK9/qrGKOkQcgdNRhjI9j56UEH687jIFaL7
	1zG6Pzf4zOUq/7S+WCATQF6JZhAyzfiZtO7KvFB1H2Gzdb4W7G5J9YPZITNcSF33+iVmq6jnKdT
	DgW/XizZNlw==
X-Received: from dybdr19.prod.google.com ([2002:a05:7300:b293:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db86:b0:384:d59d:199c
 with SMTP id 5a478bee46e88-3856c2c3fd0mr22119eec.1.1795108095991; Thu, 19 Nov
 2026 09:08:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:59 -0800
In-Reply-To: <cover.1795106962.git.irogers@google.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106962.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <1de898fc85710c85f6f90bb685d3be109f44c2ba.1795106962.git.irogers@google.com>
Subject: [PATCH 2/2] ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid
 DAI ID in DMA ISR
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpass_dma_interrupt_handler(), the default switch branch returns
-EINVAL from an irqreturn_t handler, which triggers report_bad_irq()
in note_interrupt() instead of reporting an unhandled interrupt.

Return IRQ_NONE, matching the other error paths in
lpass_dma_interrupt_handler().

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/qcom/lpass-platform.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on Qualcomm LPASS
hardware.

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/qcom/lpass-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..45379604b689 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -963,8 +963,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		val = 0;
 	break;
 	default:
-	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
-	return -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n",
+			__func__, dai_id);
+		return IRQ_NONE;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
 		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
-- 
2.56.1.708.g77570a6a1d-goog

