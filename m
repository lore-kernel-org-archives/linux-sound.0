Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202590;
	b=SYLFAm2KTDpBMQYJSmJVYl0wQpmugOkKB07gFvEOVPgbcQb08dki3etuNgx4FWQqbsnQ
	 PPmFs4UWun9JfTuNrGjVFHEwRc6DJEiR6n16eqGr1eAUHSNr9DW/BgE77H7NtD9MTN0YX
	 Zsd5yMRcBIWHKStQFDiM3rDvVghRyhoX3IE8r6tvE823X4JapqxoiKvYVt2vq8gOwLB8o
	 uFeDX8EWIQlJAu2Q10Q5a0jPgc72xrowa0kEUikax4Vg2NUJjooX7zPNt2ThE/mxAoRgl
	 hUSiOslZ0K0ysz4holdcAWaZGyTQckVoW/79uRApzUmlgg1hXN/b7JJBB7CAjYVVAuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
	b=Ncb/AybpgsJQyD+vFjOExnnPvo3nddxhqEepfIsqQDwjXjxLT9FJdMmLoq2An9BgJzzl
	 RoQYxKQRT8bl/1WXk+bJvNrWPcPjWB135e0yE8dLecfv54YNZDGExarosDKOo/xokNv/S
	 +LwJgLLIzxaI/wmKv6q77bSTj7NZM63/vn38FkRC5V9JRx94ZriYt/bK/sy21MaLwKeX2
	 nLqZmW/1UgGpRQtY1RijAUAQGUwCrteiFWDnffN8uU3cGiIFbBWRfuMXQ70UsblkVrcNM
	 uVAys/4g0jiXq0gjvO2et+wkjsyUnaNF+xcB+Hc1At4vX/UezdzvcbmrmcZyKsgxO2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kgxN/Pzj";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E43606A6CE
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 19:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E43606A6CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kgxN/Pzj
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2278065c88.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202582; x=1795807382; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=kgxN/Pzj25n0jNJ+d3MBbijp/Xfc1gOkFKnTuc8QhMBofVEjxUdit1cXWqKmfThc2D
         crebl0bqzTEAsyo8ZhCHHHU5DTv9Ud+rt12LY4JAj00YXKh/zeQYVKqfX4KIB0neIeX/
         diclQ1kfzCnc0TfKNwNTUYpX6+mHTMuRMdTVqjPWjbdcRXXaShvtwBAFLqAjchY29Cbj
         cROi8q3IB9S9JS8KHZFxEJVAhXFrcE/kiRuNiKqCRN3oDP/iV0b0Z37jQ4D80QJXvTQa
         GqZXb3oZ9mOuWCEEISbQsFTHHrZBwowqPdPI6cb7jn9uv1ncjNxftLvjp5dbrxlpUCpc
         pekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202582; x=1795807382;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=s3B0khQEydzAp5QvA/2jGpq5bAr3Tasgk9C9MGYX3dQn++1sMQNCNcHWqH/6dDZFGY
         a6cpz6o5bUaj4hCAVxl3OOiDJkx6tS0vxcKXVSxjliHOGnRgWntUqNSZfzhTJxOCeekx
         Ql+/mnvlE3DDvLe64ojm/U6HqlC3kIJv9pazOCGF1cnMUHffni+LpcfvjoxCoMHKk4Yo
         OztjnuzWMzbzpDzK3GG2gitEoKYKxzGpijqnLyi/mZVFN5loJpN5RPjhFE15cj+/0Z/r
         FpnSt7QMmvcHi/A49F6iSSWIq65fnGDQ/vuqBLUsNeAjCSlypWNFXBif3YuaP2lK4TYs
         m7HA==
X-Gm-Message-State: APuU4Z80gdLwWiQsZkQ7hmpe1CGpZnDu+PKe/6egi52dCfvUBuy2H8T7
	QFwK/BoqXNZI/LNMS6Tq4QW0kqYsZXVSEyCUTC38OTB1HWFIUWU96lA46p0KV+v8TuDLTb383WU
	t3Q==
X-Received: from dydu5.prod.google.com ([2002:a05:7300:51e5:b0:384:8179:4ea5])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465f:10b0:1b2:48db:23dd
 with SMTP id a92af1059eb24-1b5568cfbcdmr4131052c88.16.1795202581997; Fri, 20
 Nov 2026 11:23:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:35 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-1-elkin@google.com>
Subject: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio()
 error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio()
    error
  ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio()
    error

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.56.1.750.gf70dc682cf-goog

