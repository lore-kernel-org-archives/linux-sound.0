Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8EE39449C
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284993; cv=pass; b=YM9mT9jE+mE5zsptnZTYbKDJy9nZQYdIgzBsjvxMjsSs5apefzZVEcZDMCEGewsdg3+73fBFLHCOrn7tR2A64MkFRcd3iGpb+oLtz8swSgAn4mgdmHzuxwKzhFbW4F8jDOKqEy8nb0lEdZQM7W+hikcbSiJ965AsbbJnW33Vecc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284993; c=relaxed/simple;
	bh=7xITqmbUx1hnbG2Hl9SahyKAW7y/XppnkWMsC01/JTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv6glnUhx8H54AdpYtER2G/Jh9vOx6QgvZDaEDc7TYPkSJGPU0S2pwSdJE8CbATvvuPnGGiQgEV5eZSM3osI7fRrObwBU3yJUM8QmE/uolZGVc++qjYBxSODCSir/PU5FgLAQoZv54baPoZKmb3tJv2eX0VW2JJYznENVMHUT5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aykrGAa+; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aykrGAa+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e4a341d177so15642015ad.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 04:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284992; cv=none;
        d=google.com; s=arc-20260327;
        b=APwG5oPLauZEBCy6lL7N79TYy09B1gg+Yl/Q7UEvmL104zlhyVKzqL8SC8F8emJLF8
         xpPRLJUwViWM7wnMgVlLiDW0nbJq1RjnSlapOCrdWBj5vvy3hsa9+Py1mX4YzkB478Rn
         Y1utXln8ilNALx1n7pMSzT7SBjrSe9avm159q/dgIyb9FVhAoU7b8kUXn4nHQ51g7Jo6
         mfKNCa1DHvDHWXjHEnLBM1uQopNSggFx+CcofyKWrmKCOyNT5GUharHYG5YXqu8VcPG6
         J0kaxIQDXlJG10b0wVWscCHQN9xwXwL7fXBeVubjtqmlvPfKiq7CwfOEhGSw5K7cJiQi
         Y3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        fh=rQKG/Phxu6OJ30ya6Uqp8BQuqzZ4zwqIO8rMKQQcbhE=;
        b=cRWNv2uBgTotH9k8eU1qWkz08zXz/m2KhfkloL/EwWBF2q4QnPfsL28YQADDOyaXiq
         7HW1gYKn8J62574c1JWbOTbEEeCRoAn1myDbf7qA/B8Kw0ZTIPwK4Wz4gPAB0bdQui4u
         yrlsMDK2BYgkNbvTepuJ3UItQ046YneK6yV80pikNIYBWdMtZVko2pAC6XDv2jUoFcFi
         MfyFcGcNcPyqGglTrhAssz70u3HQ6lnAlS9q/fpkX/Mp/qUuvqI6hlcJS4gkazZKTqyf
         hWMjDbWMRrz+K2pLcRbxAZ39wxXh8lw6V+7isxyZs03MAD2bM/FpbhnXhgGWYemg0zv1
         qIiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284992; x=1791889792; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=aykrGAa+40PqyMSYbyIZuRWgVthc5SOSuvMm8p3TE6+e8OtOmS+qN3rwUqVh/I9dgU
         jLl1GjUnwM4GG2PBwdxKHnVwd7SwCZzQkhj95tv3a9h6pBI41X2uVF327jymglioP4sW
         JnjcGg3PGq42mVsusHDq3U2o0Y4t1NNlpMFPmPdVo3JaGicMV+G0vuESHNwgsjGuux3Y
         kDf9SndSAO11NPgPhTVo9gE29D3ziepMa0r2KcPDcV8JQ44vR6eXks4wSW9OtkUlTHLL
         6myVZV7N5/HddXcNjQHtPlmD2QP0+peZtTNl0LMPByvM6KavlKMbmSCK0u+MxDpXaWdk
         gDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284992; x=1791889792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=Vp+lY+Xf4JCwBAExdUPR6z/lhJ0DKCKEjQc7PTPMElp5CYqGQ45lGzHLGidHESJZgx
         8jT/et/5kUezM0ZLhuKH06UQ6zJka3wNy3LMjRFQ0VMgsWrU+gg590OwlXjIVrRHCA19
         S0MxeqUiFaCcxZcBBYpikzju5RMjpKfRx8GkuJVxp4BhEjluzG1pzVmVNaDFds6alyaE
         sRJo+P83jC7g75v0VbjEQoITXzoKH5Uqh8QbfF3pyRan5hylvsYfyEJ38P4Y1UTgNZW/
         lIlAuaaFoeOnQUR+WVbQBT1IWZPJ3FshD3+AAlYaZhGTnidrirachgIi5XjrMmbs66dx
         aG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmzrmUIUVn0suZJ0ip9HUEQm0V9bs5ZrDU9HjAQbdvtozFbZOtKE5QXn+o/MXW7qhpyZpsy1NWOROWgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOiKIuiUWRr/DguQOdqFMzjl+9hVWeTV2SvOEsdKnC94TxrJFT
	zxk6SJoFGHQY9hB64KJvjo3u4jL9K9lNidJxP+MFXNmWLtfNCFMnwdjeBLalvN3uCsXQj21OOBv
	qXlzjspbe6WttNLBiRt7LOxMVjFJvd0I=
X-Gm-Gg: AYBFou2ZiCRT7b/Uw5k0Lj9NRtdkeNcK/r79pkCYR06LTz10LMczSvPXVMjxtXQmDCD
	4yLKfJnqsScu5tOu85isSYukEWN/guCA2ZWvgK1hHHGlhN8MH6iAksiKUhBN4DC6su/2h0+sIRf
	q4eh564BJ5dxxQWsqkABKbFrwqWd4961wzFcpJXYo1x+VNXxnm19wOYu9EBlksjzkBk1antOKmN
	LcLujFGFnob55N+J3ThFiwRSXZfrhWHcRl4wznEFvj6ZY9/7g/5eDGibSx+ZzFJcysUwmWhQYHx
	Lu1okTqHSst68epTcpTN3E+azzLQevu+WOi4w1kLOmzTQHQU9Cbfsc+3ZVTygKkUORNeVoKx03k
	qJV/F/O+5musruBx/IfFxZBlmhEI8oNDLJxmcO7yBempkNySLS9WoyGHbJgVM9HhcYNk=
X-Received: by 2002:a17:902:d2ce:b0:2dd:ad74:ac28 with SMTP id
 d9443c01a7336-2e5dcda3da0mr8813935ad.26.1791284991550; Tue, 06 Oct 2026
 04:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-3-phucduc.bui@gmail.com>
 <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
In-Reply-To: <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:09:38 +0700
X-Gm-Features: AclHuK_Pc8LShx91NLSv5hh9JwqBTqHJzVOnbNwPcfyhu5KBMevAfkIzcISxmg8
Message-ID: <CAABR9nEp+-cM921ONe068QQ9OGH5e_+sqTpfBV73xcCCh8uu4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from
 mt8188_afe_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

>
> You can reduce the delta by leaving the original if-statement as-is and
> following it up with:
>
>         else
>                 ret = 0;

Thanks, I'll make this change and include it in v2.

Best regards,
Phuc
