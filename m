Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4813D285
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719233674; cv=none; b=W1BWp5wphLsVFA7ONnohrMAVrvyQbu6RLSopI8t3rPJ0eFimZGWf2DnLe9ka0K4BRq/E0jWTovVeNkqe7ls4aDWNWkbgyrGsSW5MyvaawpVUowcjK2NHR519orpBo7m7TyaNIAiepsQmyB+MhkdNrwwylnQ1rwEBZgO9hX1he1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719233674; c=relaxed/simple;
	bh=DOxpGDRPXOULudQMfRyURG+LRWh3ynkAOi8ERNjON/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZjz4G1Q0KsxOZxOPAGulDkCOqITLCjJrT8WtdpG/SMu94adSI1WJsvZBSX/2Ak6smE9Htpuhd8PwjyEiIf5eCl3XUSHsk/7WS4fj1bFOxP70v0BgaMYjH68JOIy4yQM5+QNoMyye+A+0lQYfb1cTOlGP0gF9WNgdIvV5H9q7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtSvxBEE; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtSvxBEE"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-632bcf111ffso40326227b3.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719233672; x=1719838472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4MhoPIjswsMp7f7a8/ndhL9pANhZJFzHy+iV0sTzTk=;
        b=DtSvxBEEy6zDc7eqfmXzzgHKKeEFIglDj7rFFmslwBAG4coJwbFa3tTmqmHjZEMzgN
         3j0yo8GpMAAZ6rVGKRPyazs2FH6qTvUReAznA0gIiTzapS8XxIojuL4SLTlTmhTMHEZ7
         pESD+GwERCoS/86FQ5j6MuUsQHva//d85yDzZEGEfxeeFPQg3amVHgY4vMYqr28jLapQ
         cVz7mMzkj/cxdbmZScoiXn4Ke33r7tQwAAxEikgoA6A5FUS1Gcg3X8AwFy6h2dk3XRS6
         ZL/Sj94EEL8GLqriVthUuvUjt1nU2PaWCokok3W9MIn8d02E/VX/LgRsbLjzF3gR2nAn
         XHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233672; x=1719838472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4MhoPIjswsMp7f7a8/ndhL9pANhZJFzHy+iV0sTzTk=;
        b=WcxuhcU1Zq8zWrViRnjCaOkRFjEVAh95y7sLO7Kfifx8cLFZow8DNeCn2mG3j06iut
         o2XR1AzRpRJzimww5SUljcr+3vj0ye9+nQggHyu58mEEqbZZEfrj7Keg2wEiNlqxdGqx
         Un8OVCqibh4rgLRvrG4e9wV7Qf2dh4kYNG3Er2cQzgjWxzj4AA69E6hvrEUoWLspN7vC
         wdJ+Grask6Vck32qznfv9XkqaNjXTl5o2Cpv2akz/7/4+dMtSAptTUIziCjkzeKC7Z2A
         17CG0awx4q5ACHbg4QHqlDsjEwtN6/jKzlqTAnq7R9nxyXv55IANz5aOd5uvFbwyJJgt
         tT8w==
X-Forwarded-Encrypted: i=1; AJvYcCXR21up8nyI7XlqtQpTCWYAmupzWIJPs7pqeKwOf3urCd/NggT+LKOL9YxBNgfpDTJ8vXW+tLUO+0psGPABa9InXaQTgZAmsgPu2LY=
X-Gm-Message-State: AOJu0Yy/IVC0EnWf6JIsoLWFjezM89oEQKCUTSgom8WIytrFiABilW3Z
	zZ8hKKi4UQ6AiVDuQM9wPCaIo/A4kUizJY4iLfJVhiCTyLP2PlZjiHodq1eOU6PZJLF58Zdw9+2
	3iTVyWYIE/pcfe6DRNlaA5KV4+Jyok+kcCdqkkg==
X-Google-Smtp-Source: AGHT+IEEe2Wox3jWC9RV0LVT1QsuSsNWmLHgdKtfDBvlgM6eb1pktgBqHVRKocFL/tWEa8Hwpz7Px1YRrvmHbynoaFc=
X-Received: by 2002:a5b:bce:0:b0:df4:476e:7577 with SMTP id
 3f1490d57ef6-e03040182b2mr3570101276.60.1719233672328; Mon, 24 Jun 2024
 05:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org> <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
 <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
In-Reply-To: <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:54:20 +0300
Message-ID: <CAA8EJpoLE5zUEvC4-q8h5KH=c_ucew=py5TV2qCTaSEQNQeQzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manikantan R <quic_manrav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 15:35, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/06/2024 21:28, Dmitry Baryshkov wrote:
> > On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
> >> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> >> paths eventhough we enable both of them. Fix this bug by adding proper
> >> checks and rearranging some of the common code to able to allow setting
> >> both TX0 and TX1 paths
> >
> > Same question. What is the observed issue? Corrupted audio? Cracking?
> > Under/overruns?
>
> two Issues with existing code which are addressed by these two patches.
>
> -> only one channels gets enabled on VI feedback path instead of 2
> channels. resulting in 1 channel recording instead of 2.
> -> rate is not set correctly for the VI record path.

Thanks. This should be a part of the commit message.

>
>
> --srini
>
>
> >
> >>
> >> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> >> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> >> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
> >>   1 file changed, 68 insertions(+), 44 deletions(-)
> >>
> >



-- 
With best wishes
Dmitry
