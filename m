Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1B323BCF7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814910; cv=pass; b=ZpxeWZ2upX6iyQApY2YlfDsA/JwiDQYxznkddSccwrp/4M/HL952lNpo8erjGNs4RRey8jQBeMCilTlrsJ2ppOuiZBB/pTxqK6xvvi9rSzZZ1zmLZqNglrU/rNxRoikGX1ik7SxKtmIq6eJmIByjJt5IRrwpo0PA1jq6pU5afWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814910; c=relaxed/simple;
	bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUfbbzTlnVXC8YvRJYkS75Ue7OEnF/SfaFGhgp4mtVyVPyLnUBwl+Xa4lfIGlfCJ5G4PbTekdVmz4uo+R+XZNuSUbSHWpiJn5a0frCPTGCi1TinWIg9cMjP2tN0afEYlqyETykxMsDg0xOHICU2uJQma3BZjy2En/Tze91nv/CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWSshGS0; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWSshGS0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d01663d816so32095385ad.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 20:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814908; cv=none;
        d=google.com; s=arc-20260327;
        b=VJJtotcECO6lfldLcBZRXHfw+nCLzeUc9PysGFifJdXzE1kGoJlINTIWsqRn9mBE/R
         Vbu1vcwopb6Ljr5fZmJICH7HxECOfcQFQfFm6Gjtd6yFvzPKTfxEf4QgI7Py97WVRN5c
         4NGYWwviMM9PocZz0/XWHvPgNJMhL0KOiQ8/WilqmYh4Quzt7Ux0Hou6gYHRbrBBXp9o
         rj1FX1uzKI09xKn1ebKWP760fy5HQzmCxDLvavtovOF4kDJL/yntDgNGp+2Hqlk/+ltw
         I74eI/i3oW7SRQ13xmc+frWJdBth79HchouOGP3AKXoXo+TGEH6/FyO6rmTEqxX2MppA
         3uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        fh=ybsjlYpULFwtnf1rO/OHLTnzDGeEXtre73z57X+fK5Y=;
        b=IYkK7ZkPLIDdqP7QDx3GYR4s5or08LoqzuSJUJJsaBQYS8ZNDjtSIfTDY1O8Bi0Tmv
         Ei8cbefFQrOtHjiwvzFvq4syisclw2F14TD2UFugOdpeOfKCnpprk6erv5kIBZnG3FMg
         BbyCgd9AIWNrWm+/cBUqKtGh/byHmyY2T7A81bbfBJ1HIH8OgOtKP+KGXZ5cRcQ9NhZi
         GprfoLyNQrWUNA0P7nD2KPkyzwZaB4wH19ZEM96HsjvFp2ht2/dzpeksn6NZNyeaRLfA
         TLNJ27XWKwV+R+g5HrEjx2y3AsrAP32yesknldmidH4nXXgSwSxUsIUvsdwMea4OaRg+
         /XEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814908; x=1786419708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=PWSshGS0FstcizQ0kTqxzta74t7CqTnGK58+XL7alYiGPqXbWtiJkelkYuAHOeo3Xx
         lEywCATCBi4QGXjbk6W/o2L3YNJGQsdruf6VD/82abR8NLYGndz85FENJ2RK/dGvKQoo
         OZRlCFf+0BRsJsDXtiquSLfHVs+R77f0fI2bULeGkQIZ3BJeEeNFb+/MUmtFsTxMVjeR
         ooYpiAnkHMRX39M0YlaV+njieMcxTHO91QQ6ZJ3KE8bdaDx5M1f6L7qmKsbWPTK6ti7P
         iBwmJyw2AZ3DnegglyE94pSb9azIJ63i5GnPWpU5rv+04ZOIkt/qJorHRIASl9rq2/N+
         sv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814908; x=1786419708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=jbKap4E7DfVp2AnTmhjvphlk/2eRwZ1W0S9mgCAfddrT1nCWfsQ1RYbrk00i5XJB3B
         dehsoXbsaizDRd3mtQRhfq+5c2lL9k1inbs/0AsM+5kiwSd4VNchxKeE4ZsWfOJXp6ZU
         ScmSMqMQbDOSZOt5VNoG316jSwl0X6jZz86z1+zSt4qDug3kE/sTqGBF6rjYYwBp8QO8
         PuWCq76QIF9cZceJ+8/5+hv8J7O2C3gKMINSoRVyCe+X8PIo+V4E2rZrdS0Mo11uoBws
         nHeRCUOmvZI6W04+P9KNiNdZwFP/51t7TZj60OF8sId9+UxCq0WpTN4igEqsuMNciRoD
         XTVA==
X-Forwarded-Encrypted: i=1; AHgh+RrKI1wiqpz2hiTladBI0chvvZlvPf1wuqy/TNC2LewpTm9RACQaFcdgnx1rOR8jDkc8sSYO6tVyBpfjwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNPnpeovYvpZFgyUaAzwWn2rR5+1xjTLKEX5MaFHCrliuBVuen
	I4fy+z9xsygOYemH6RtC5sdUwTvChrT85zwPKRpeysAckQDjmgkMfecLtEAJBR+0jeEVHYv8X94
	gy9LTzeUyDFgnBrwtpa3nIKijBXSzBwg=
X-Gm-Gg: AR+sD10G/qy9mdCsu9UzOUholRVrWjdnjqw4IAjEz2VPdQWdoL3d7BvLlEbqvF/rYlr
	e3/oKHUvlBqF0JSI/UVCdSE8I086gIWOL9JVZXQEaeMNMAnwVefmR75+h+zM82KUrqD975WOqKK
	NbcCX1P9GNo7YEpbx9Gk4ddUuRRlEXU9E1EWkoWRW8uvryL9M5OQ6AV9zngZzA2ZMq2HrhZF3LH
	JSZ0evGJcEgyPwGF7QMHrVGKEyKN3b44eKDxULAE3oIR6s+Rik+llB4+0gLkRut9pTNRD40L0i4
	+3FjMf9IuOAHVGhnqVgSNvbXFg8ggfxOeyZNBDtnrcRx+RrA8eZjNVVhNBLv/Eb7V4wAKvTtnw/
	o6M/eJEZ5XYPV8HT1lzAAeLcg6lsSU6pzQaPY9CCxx1fDuKkJfp8U5PpD
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2d051efd46amr123451215ad.0.1785814908348; Mon, 03 Aug 2026
 20:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com> <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
In-Reply-To: <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:41:36 +0700
X-Gm-Features: AUfX_my_ZTitbKpIGPjAOMpa4lAbJZAoEqlQiMARrsgDTH0HTjCNWq0y94hxl8c
Message-ID: <CAABR9nHZgDvNBTT=uKO36+ExC5ozi7mWbS2J-3MxhN4GctpYHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thanks for the clarification.

> Nice catch. Please follow the Rockchip approach: keep the static
> spacemit_i2s_dai minimal and initialize the playback and capture fields
> conditionally in spacemit_i2s_init_dai().
>
> Simply removing the assignments from spacemit_i2s_init_dai() would leave
> channels_min nonzero for both directions in the static template.
> snd_soc_dai_stream_valid() treats a direction with a nonzero channels_min
> as supported, so the driver would continue advertising capture even for
> a device with only a "tx" DMA. The binding permits such a configuration.
>
> Please preserve rate_min and rate_max when moving the capability fields,
> and send this change as a separate patch.
>

I'll follow the Rockchip approach and send a separate patch.

Best regards,
Phuc
