Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10F1DB344
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160286; cv=none; b=bswY+0kUxhwJKpBpiMivs3+GGzO2CiEeaaUOMvGzz95y1MNVk9sfz8S5NAhdQPrd7wtMHJLfkN4rFnJGDkw+7bnSBpH980YM1BCD6wz/Lq1Y8mIIGt6buMRFwa76RuwecvP7KoBOWgDoAinTV6aGHh73sss+5cCy8pyc599jVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160286; c=relaxed/simple;
	bh=3vH6aleRK2+3XK+sc379vGvt8zx/8VYWMgVOZsCzJmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iS6m+MxyiE2HO5m3rV9C6j/5n+ivCJ6vmy+0yLMC6q2HQZxrZjzfFMiWmTgsmCoMjq3mL6DiKixqE3ZFzBnVgpP37Gq9WsgreZuOE6cHMWnBgv46XmrqBKnaqnNvYFptdoNu//xME56RQCqgsVqvpmuIBM/9muwYP097MO6FsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=imzHTGhU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="imzHTGhU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43623f0c574so97382435e9.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736160280; x=1736765080; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=URK3fgfuzCYj9ufRvcHXSc7DgTihX+ky3vmNQnZQfBc=;
        b=imzHTGhUiiQVgV749MAYxKSnfji8utwsZkVZSUa2IAkHzwJjvFYjz2i/WAupzQ9ahF
         tmLlo4QD/3+XrXBSd5Snam1XBayfEKzk8cVcxVHNu//vEKj01YCWWdG5CfqV8nCPn/Xl
         7DDc4T5Ql3xNBSkPKEKU+mPKvG+QhFWylQdomuUW4x7kqHUwg0jNLFgvtKBqizdFeHnm
         FVnCsv90O5imn6T538BRnseR4We8Hz3gpH/FPE/W6rOEc+N/zoppg+v8EQlru9JdHUJ2
         Pt2XEdgU8MlIYU6lBL5fKbGExMGt1wbhjqyQeChVvwJ84EpPfNSRMXtvwWPr+3OQy7xT
         sYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160280; x=1736765080;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URK3fgfuzCYj9ufRvcHXSc7DgTihX+ky3vmNQnZQfBc=;
        b=slXVgy6zvQ5ZY/uvC7Ot6vgqHL7A4hJcoU1sLbVp9FJzQKwcHkYc6plq3/B8gHVcdb
         vzpHZ67Pu42bjy8bY1Ft0g6FuDClSy30W+nGCSv2q5UObplZG4jeLhuywGU/Je2ff1A2
         n8lwRGOtLzIeHxuQYShzd7N3PDFzDR1zWpnyrK8s8uZ/Lbhd06CUD7hNsyQLUOpNOdZr
         By0PXnRVZR6z7j0WKdT1yyruHSXqxfm1yYMFyt1mGsRURhFjiehnTabJ1XEKJv29clj6
         +c8wkbRjpqJ7iG4tcppguV5McD/SPkM+jjUemi/lEWkY05MN1LHLCLc9WcSyiQlIp7UB
         LE7w==
X-Forwarded-Encrypted: i=1; AJvYcCUsqAOeLu+SOH7cEGcCINtWuHHdeCVpXw1pS7tbkTZfPE00rS5NejwGdwu+LeoT3cg5TseKT7j3QwdhNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHH/Lh9ElRoH68V8x17sZf0LwTE2vJ4dN907/mu2e7hOqfbsEI
	hdXr4vFG0nzyf8smAfgB9D38fq3x+GiH799ojNgHTTvabdjudvlyjege+W1Di5c=
X-Gm-Gg: ASbGncsOzLEAu+u9F5RfNFP6lp7G7UqzYlUeNQGUmyRxnsAKDzBmR9QWJyveWX0QjEh
	HpMbPFOnhtm0+MWJzIr8yFGHWrmBu/nmTtjvZN4+cs1UdIOaY/eQDG8dPyEbsd7dEFs9naeZlVt
	IA9o9AEeOyp7wHS0toBksAUmf5Z2lIQfBj9R9hy3Mw7kkk/2IaOpk/xnbLa0BJk5fY5FyRRyOlc
	DyHydC5oZYMHyc/yua+zJpTlmW3lkRPQhqKoLIC0pAQ2Qdee/wwJLHl
X-Google-Smtp-Source: AGHT+IHoY2q0XdnrpBdI9reTe90onfZ6dA7Pk+FthfP9lXA7CWjLaTCoOtDhHYEthX6HJnO2DBTxqw==
X-Received: by 2002:a05:600c:154b:b0:432:d797:404a with SMTP id 5b1f17b1804b1-43668b49976mr470611445e9.22.1736160280576;
        Mon, 06 Jan 2025 02:44:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219578sm569128335e9.20.2025.01.06.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:44:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dmitry.baryshkov@linaro.org
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
In-Reply-To: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
	(Martin Blumenstingl's message of "Tue, 31 Dec 2024 19:44:20 +0100")
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 11:44:38 +0100
Message-ID: <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 31 Dec 2024 at 19:44, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> I am still working on a HDMI controller driver for Meson8/8b/8m2.
> HDMI output would be incomplete without audio.
> There's a great series from Dmitry [0] which simplifies the HDMI
> controller driver implementation by moving all the hdmi-codec related
> management to a generic framework.
>
> I tried integrating Dmitry's work [0] into my HDMI controller driver.
> While testing I found that hdmi-codec's .prepare() callback is not
> called at all and asked Dmitry for help [1]. All other callbacks
> (.hw_params, .startup, .shutdown, ...) however are called.
> On his board (Qualcomm SDM845, sdm845-db845c.dts) hdmi_codec_prepare()
> is called by snd_soc_pcm_dai_prepare() (core sound framework, not
> platform specific).
> However, on my Odroid-C1 this is not happening.
>
> Looking further snd_soc_pcm_dai_prepare() I can see that
> for_each_rtd_dais() has three entries:
>   snd_soc_pcm_dai_prepare(), dai name=I2S Encoder, id=2
>   snd_soc_pcm_dai_prepare(), dai name=CODEC CTRL HDMI I2S IN, id=0
>   snd_soc_pcm_dai_prepare(), dai name=I2S FIFO, id=0
> What I'm missing here is a dai name "i2s-hifi" (from
> sound/soc/codecs/hdmi-codec.c, see hdmi_i2s_dai)
>
> My hdmi_tx node looks like this (abbreviated):
>   hdmi_tx: hdmi-tx@42000 {
>       compatible = "amlogic,meson8b-hdmi-tx";
>       reg = <0x42000 0xc>;
>       #sound-dai-cells = <1>;
>        ...
>   };
>
> Then I have a "amlogic,gx-sound-card" instance with the following dai-links:
>   dai-link-0 {
>       sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
>   };
>   dai-link-1 {
>       sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
>       dai-format = "i2s";
>       mclk-fs = <256>;
>
>       codec-0 {
>           sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
>     };
>   };
>   dai-link-2 {
>       sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
>
>       codec-0 {
>           sound-dai = <&hdmi_tx 0>;
>       };
>   };
> So apart from the additional cell in the sound-dai towards hdmi_tx
> (Meson8/8b/8m2's HDMI controller has two inputs: I2C and SPDIF. I2C is
> the first one, hence &hdmi_tx 0) this is identical to
> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts.
>
> I have further verified that the gx-card parsing does find the HDMi
> controller and links it correctly.
> To me it's odd that only the .prepare() callback is not called, all
> others (as mentioned above: .hw_params, .startup, ...) are working
> fine.

I think the problem you are seeing comes from the quirk of
codec-to-codec links. The hdmi codec link is such a link on Amlogic
because further digital routing is required after the backend.

Those type of links are not used much beside some
CPU offloading on Samsung and Amlogic, as far as I know.
It is possible, even likely, that things are still missing there.

So those C2C links are operated by the DAPM events, not the regualar
ASoC code. You can start here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/soc-dapm.c#n3995

You'll see that .prepare() is not called, same as .trigger()
That should propably be fixed :/

Side Note:
While this type of link is not used much, I think that - fully
implemented - it could hold the key to proper DAI chaining ... possibly
allowing to get rid of DPCM.

>
> I'm not familiar with the sound stack and I'm hoping that you have
> some ideas on how to either debug or fix it.
>
>
> Thanks in advance and best regards,
> Martin
>
>
> [0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
> [1] https://lore.kernel.org/dri-devel/20241231004311.2574720-1-martin.blumenstingl@googlemail.com/
> [2] https://lore.kernel.org/dri-devel/l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6/
>
> [2. text/x-patch; sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff]...

-- 
Jerome
