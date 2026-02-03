Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386839C65C
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125778; cv=none; b=ap1liOaFOeB5MTEJVMqtxgUzYEv6ivt9QI1bFfxkqTmVpjjDMwlwlSEc0GafDR8d/ekw2x8Iz0+SYnkwwaEnfy0Yc9FWe3V4WvBDdYsQY8RLZsx/P7QMOmbjBiL7S0t+7JpCplVuGfTYTNR9+8XKFdpPaLeB+3YYXcwNsVWLZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125778; c=relaxed/simple;
	bh=7CJUlpmCMeQtMg1SOgCeqfWCGzqWWpUYJXYnXnJAABI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtp0pYTBkQeBvgamB2t1iFaiKd6xC1cmKkb58OfhU/KbLI/Kcj8WEi66qluDxsPMr8xxicTj9Yjx9rI5jVLNL+F9tBHv1uJGAIkzl0QJW6DPr04Wg/aVIWnYqcMcE1us821ah9rtPRYW/CwFUCBQPXA9Rmr9MlsanFXHkQJCYQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f7xSaAl6; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f7xSaAl6"
Message-ID: <505b8820-9ced-4554-80f9-de0409859dde@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770125775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CJUlpmCMeQtMg1SOgCeqfWCGzqWWpUYJXYnXnJAABI=;
	b=f7xSaAl6BlBMvmi90YGv842PKfbWHRXAS44bXhyLbru9eGCSITgr8R5KbI4Hn6p/KK7/4Y
	J5CzLa9HMNXp3HwvXQJJzjRlscOUgnAEnIvdK5+tpEmkOpxpXjjlQ4bKOMPdhC/nIsz0PS
	Znzzxw23EU8yCjXyBDpWMZMNsKTPpvA=
Date: Tue, 3 Feb 2026 14:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ASoC: soc-pcm2.c ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/3/26 07:27, Kuninori Morimoto wrote:
> So I will not care about detail things first (= sampling rate, channels,
> etc,...), but focus about graph / routing thinks. I think this is the
> main part for it.

If we truly want to support digital routing, then this information is very much needed.

The graph may include elements that are required to adjust between 'domains' or skipped.
For example if your ALSA PCM device is configured for 8kHz and your codec DAI only supports 48kHz an SRC-based path needs to be enabled. Conversely if the ALSA PCM device and codec DAI both operate at 48kHz then the SRC can be skipped completely and not even be represented in the graph.

In addition, even if the sampling rate/ch/resolution properties are added to the graph, the concept of propagating information to downstream processing may not fly in all cases. For example, a mixer will typically be configured at a fixed frequency. The mixer should not be reconfigured dynamically to account for changes in the streams that need to be mixed, it's these streams that need to be adjusted prior to mixing.

I personally really liked Lars' notion of 'domain' to define strict/well-defined boundaries connecting subgraphs.
