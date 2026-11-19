Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108283;
	b=MnGOAmAps58dWaCSbkLnMcXEEyOQOdt7R6TkKqT6Zz6CSOVG5OIkNv/Rl2riltC+JbfE
	 l4ConeUvUkvL5QvPeeh6ofzGRrBoFThwubqz3LKl34RPo7x/7USJLwfArpqlgdkKl+rg0
	 leNsZVd75b6HLIUJLQNyhuxD3JT4sp/hpFtHLCQ4okUZGcjMdCxaZP0IIyFB0Dm1YUxLc
	 19gvaOoxW5dQ4nmhdE7Dhq4OVqtQS7/1WLPzxp7kgMzvk2YAxTqZLif2y4tZkTAHRStTV
	 EQSXLKNR3KLnNKLQndu6/jXS3MQv48fzEqNKIExfFPw87RL8FY9E1nEhGd8vRNjOcQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
	b=Z3QBJhXwty3hfwx7iff5OsvySzhXbKpJsCDmVg8zrAud699Z9PapICoO2+YmTZYbIgHK
	 4Zn+hLkIfi2rJ17O4k92vUM2ui4cTOork04YmALXiSnlulBlQZNg2PCeoGWqE5XDavexd
	 ++0oQx/QG5BnqBIbPkkfu3MVT86ov93QKolveHsd3fUxfvbUtDq4IjSjtwdT/1hjwTAQw
	 2hCIpgKVbTDvzsRjqQooejU3XfzjimOTXOlIbcvfs5gMebvGF6gBRiAzzAbm2PzgH0VwC
	 XtQPq9RaEUfB/xgmgWzBLhbzIRggC1dGHeSy0q4wMJ/pSIZKfGOMl5pDqsvjFe3gyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lyMZaRmj;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017A606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D017A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lyMZaRmj
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2054718eec.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108282; x=1795713082; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=lyMZaRmjhCGX7+rYzWUansfk4MP9s1YP6E7qzUWUW1XDebDWzgNRMaURTDhjrmflD7
         u2RZz+K05GoJOBtAVT7c81qfDQX6wQJeTM0A6ND1fURG5ZmF4EqNYYJ8R1zGtbe+a+C5
         u0DlcKb0K8dQ/4kupfGPOwf3WRmdEg+mSOp8OSXjaDeKtHA0XIYoCJti27GDms7z0Oc9
         AfD9FyLOxhQ9+GoPhasheX0FZIoQNqrk3bM9m26bzMhkaKlX0vvP1mAdD7p1TPJf+QNy
         9bBVgu1C+FACzcRLAv0m/4Wzagc+/MIm9KcncfF8OxSbRqv/wCEYQXPzazuVa5Gi/RxD
         OKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108282; x=1795713082;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=fO6x4rEwrO2NUZrgCtT+LNhg+eu2efLrDgZrsVMcpabV4c6WXsjMPhXljcOjs+bWJt
         ugPG6GScoR9E0MTNhiE2RCsLGjkNwW3Ms8dpGIXcadrI0nQDsIzxM9UvReckaAVe2qpF
         xZ16Q7nlJW5w6uTr7KSbN/HnzMRa4xTX998DsD554G2l7FVoRCRjSgYgahhO7pbMva4g
         HZYCjGibk4R1F52IXqY07nUbHi0tqUK/IfFhjWP4pywdCYbeQPzg0b1SNaEoOfKQUe+f
         t4wt3Z7DrJazgmDiAQ/g/Nz80xv4B14o97FefwvNaymga6V+GRKjEV67zCbUxQ1y5s9V
         LS6Q==
X-Gm-Message-State: APuU4Z9UtrHY0chOnhONNDk5kU8RUPaKV0rf+NnGRsl7RADbuRlpOUDO
	h2935Hea6DvJs+TZAnoNDYinOk+R9NlkYpqc7rZv1F6MVFEqYYBKF297ny98IjOOWVskQOQyMeh
	SbOQ1avRN1Q==
X-Received: from dlbsn4.prod.google.com ([2002:a05:7022:b904:b0:1b3:b6c4:6fd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4308:b0:1b5:1a6e:1bec
 with SMTP id a92af1059eb24-1b5568779e3mr259172c88.10.1795108281678; Thu, 19
 Nov 2026 09:11:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:11 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171111.1538575-1-irogers@google.com>
Subject: [PATCH] ASoC: sti: Return irqreturn_t instead of -EPERM in uni_player_irq_handler()
From: Ian Rogers <irogers@google.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When UNIPERIF_ITM_UNDERFLOW_REC_DONE_MASK fires while
player->underflow_enabled is false, uni_player_irq_handler() sets
ret = -EPERM and returns it as irqreturn_t. Returning a negative errno
from a hardirq handler triggers report_bad_irq() in note_interrupt()
and bypasses unhandled-IRQ storm accounting (while also clobbering
IRQ_HANDLED if an earlier status bit was handled in the same call).

Leave ret unchanged (IRQ_NONE by default, or IRQ_HANDLED if an earlier
error bit was handled) instead of overwriting it with -EPERM.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/sti/uniperif_player.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on STi hardware.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/sti/uniperif_player.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 844ddcfc421a..63dfe2b4d304 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -117,7 +117,6 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		if (!player->underflow_enabled) {
 			dev_err(player->dev,
 				"unexpected Underflow recovering\n");
-			ret = -EPERM;
 			snd_pcm_stream_unlock(player->substream);
 			return ret;
 		}
-- 
2.56.1.708.g77570a6a1d-goog

