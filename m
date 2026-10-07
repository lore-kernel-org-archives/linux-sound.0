Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44141D638
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363281; cv=none; b=T2e3BfQIPycA7liWnzCxw60ZGEwOURp1wQ9eevm7vVk2v2q4l7lMEmCaT2TE/MoSL9CTyFt3FfhkFA1tRhiQyc3XH1GMduMwVcekghaEd+KCukFISgLyA3zQkH3mPxCPVIOSpmA/rpBIeVY9i+5kpZiuTQ0e8yKBvLYEUKwzoY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363281; c=relaxed/simple;
	bh=ns5/UMhLGw+gH1o3rceBplxKe2Bd6QRnvxxVs9U2EY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G0iShWqsMCcr9W8/qWZHNFuHRg2D2ChZDFOg9bpQ/6kaOyUZFeQKuTyLujk4lAHlzcaXD0T7CdkhYMN/gJ5GyniY2fywPAMOwWH4mNUPQ6okiuluStnxo4QGDZOWs+N1nhWcRA0yosVfpU1yMilsxXILUt31z0xC455TSjtiw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ERHFbE6V; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ERHFbE6V"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34408115e9.2
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363277; x=1791968077; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=ERHFbE6V1+V/7VOdb1ufLNWhqdmMi/ZZmRNdq8Uk87mYA6D/Usafy2JxF+pgfZmZan
         AineRSrkWlAew5VIfIiwgRR8T7fycBN/YAIkSXH2y89euS/CmzewIE2wYT/3RC/+/Msu
         y+PPyue6d1wnkAejn0wg7epoDyxjmHHveXhsl2vDw4vKuIsUGWW2UU4XFdAVNLsXbm5k
         JGX9w5idpyYFEV5KfOHelBVOieVU2THKbI7ji+y1eVF3ZCAe07qPcEmnXBfDOcpJ3Dhv
         HXGAtec1XdKMxZZj4Hd2jF+/PeCC1QAZoQD77QWDampIkt/v3BXOPLUNQVjSbyllxQ6A
         WVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363277; x=1791968077;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=j2HvWXFNqIZrhEdZEYhCeQfRsMbOeDl7o1wyfbHxWaDWKwoW2ZDXK6JvF/axKenfEl
         EO5SQrSLN3G7l4V/ioUduYotOnVx+nUOx+GrR6PSV8TphDxcjj3dxI2gtPjIviBuQiLN
         Y5RAu+WBQbOuFJch4U4nqJcx8UVRFQ+mVh8uTKKWDx357Rj7Xc8ZWlsZPePV0epLnyc1
         KhGKPOc0Yok4BQwJvM/L6ldhvX/NnrhvxwwNDe3A/RVEc2//o6rWesFaPBWvxeyKkJ5f
         d8fC5ABwta0rT8q43TarV6kVScB6tH4MI4ufKK6LWGiDFgjq7iIboZQYo6uuFHMilTcP
         8/jw==
X-Gm-Message-State: AFuF++l3ILwf56Avgtka65X1LVezWh9me2CfcFwh2fzSLHaF0BFEtDKR
	ajipocVj3MwJFO++nR1MsPL0qHOoK382c1je7wZGOhZN3zayV7VLqfRy36k+AnMXSng=
X-Gm-Gg: AYBFou3yRQ/lqYNbF1dLTLGPn1sPzvmUYJnxWKwY0sUKw3loboYSaSWTVMvB5hkpmPz
	/7q+fR84kac4DpfJCwIMQOd+P3eEJue+/5K6bbeMRe7lCZd3U1/GC/MHtzZaPiZFYnFgmvQ1aS9
	KcEy+/tgri73waaU/zX5qLBV86qz8MEec7d/Xs7NM0OG8MTX2EO1D7zWeiGRgFcSQbuy/0ZP6Nl
	+vqcj7XT4yo5HB5b8F7K0SBmBpIUGI0L5HMUIpAyETWR6CjaEfMbVg8MwzRhGmJh/L4KDUK59Wf
	4ZSEwHRyIwnIYfWbGZg5Hrpli2fjF6tyEpibumY3n8At8plE9BqRwYnndKi4ZZQ2VPhSbuDzmlQ
	QOn1MnjkJQ3vGyjb5VBNvBITHIH/FbcFznJA7AbkcQDKsWCoA30YsF+teg8GRuIeRvQLkA+FHvi
	+5x94V8+GRHShH926fNwI+16F0bPCSpkWZ+lwhEgYSczM1f+RSfihqT+cgIkgfBOBtgNW0NMCmk
	2y+bW8ln1mTwjM=
X-Received: by 2002:a05:600c:1551:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1804436c7mr20240445e9.16.1791363277470;
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5df75sm119201005e9.15.2026.10.07.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
In-Reply-To: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-7-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:54:35 +0200
Message-ID: <1jwlrtyjp0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.
>
> What's missing after this to get capture support working is to connect a
> capture capable codec to the SoC. For example to test these changes an
> NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
> custom hat board.
>
> The following additions/overlay are required on top of
> 'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:
>
>     &sound {
>             audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";
>
>             dai-link-1 {
>                     codec-1 {
>                             sound-dai = <&sgtl5000>;
>                     };
>             };
>
>             dai-link-3 {
>                     sound-dai = <&audin 0>;
>             };
>     };
>
>     &audin {
>             status = "okay";
>     };
>
> Then, from userspace:
>
>     $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
>     $ arecord -l  # find the "FIFO Capture" device
>     $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
