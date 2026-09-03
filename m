Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E551132A3DA
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404325; cv=pass; b=QyFW19uF5oi+UVzMZuFigpQiY8+NCO6+ELvJMyY3h5BeCxw1W5gyIY4YZmlhEkMyoLTus+uRjB1xaoaj/CxK31+/p7UhibE3kyn5wyaeNgGm8dwey1/CTpQKdKLXFMepCOKE1LcoCt6SRwSGrBCD06ifnJJG/wc4jmY9Yw/x7js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404325; c=relaxed/simple;
	bh=Qb1qBBijm4jWoo8sA449MyT9wTONvNTsdJy4cOWMpyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgL4qniItvUpK6LHmFiwpSWDjVLTPVpGXfKJoIjJjLooG4kAr+IY5Q2f90diUdZZrUlF0LveDZf4MxmGLvfRT/tCBWQhp5Z5iNvSm26SdQVR+LuQFMvTHDslyIuyJXHUeuxZlnuAoSzWoSK6SfWKoRBISzMcI3O8kdw+Nn4+AQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4aXsoZD; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4aXsoZD"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c7364550so2043587a12.1
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404323; cv=none;
        d=google.com; s=arc-20260327;
        b=nkypfbhQ8WOyV6CSV9vjfctkK/TUPic5jP58IP39q0RxvEdnWARhKU4ZkqPVGyuFCs
         6G4EMOqIbSc+d/VUJT+bqkKiEpNHLCcGur2e6wreTAFOxxDqdAmjZfBhejNKcYDoB2M8
         gh7bwPH1k7JGoYwi/WCApqTo2t8+9+Hy+uxqyY/IfIqjL3fLJg1K16XJVb6GTbQNuTbL
         ghCfeWYoRKk1AWQ+uTJxmb9LWz+snKZpeK8hBOf2lQuAOcxAonGKaTcZhlTPsp6BnLmZ
         95TOH0hZStNOKw4Mnsm3RklMQsMJ5fvaHRfcx5lCODcioP2eDRmPtqzipoPxv3j1plMU
         UGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        fh=wpRuqUOfdtQzF8KUZ3qDZkEQkXkXVnwYkgTY0tsnAA4=;
        b=gJGLlFPa/f+r9CmOO8tl8mPeJAAQUxZPSlekd6tIE3HpBt8Cwue1SnChpSoe76/FfZ
         OD1RjhriO7C3tCNbgxrQTvz0HMGeutBfzG/5kxvC5FyZbl1lCQiKyZuPog1fwyegcuHG
         ai5tpW8h4tVhJy8ldlw4TkfLfBzn4e/svx4b8Resrreco8xOdpf7ODH+7DWpj8bbXuBn
         Q0a2TADW/UNVKH5YyRV8cgLagGtw8hIkgVdUrhyZx62mEtE7TnhkoG0D6Kg6b+qdmge3
         lyJymWwizbboWyJvZxdK7e2FOIXcT46Fc2P1laW6fCFgc0nT+o54ugZufzF7yccL9ap7
         rfaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404323; x=1789009123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=n4aXsoZDVfc+HLkCWbw19ZeNg6aRx694pzhpnu97+A65dsWlRyb/zbirsawXgO3N28
         0irtN/ZPG+qawvfsdha3P8mRFms3uLN7SmYQ6AK/YINrFwmpD/XiwWkRltGaKmCJxgmr
         98BsHe+bbJPt213fONW6Cp5wFeIom00bU0SARyNb25xiJc1E+3dJJOAcxG3QNowG1BOL
         jNZUaJr73pfkRA4n1NEYE2vmbAoEUYfewZWTpRKU85/vkY61VQ/7ozdok+AKzm+ZCtcB
         Tr+mTnubDXkHjKMiXGIRAgLxL7S6w0YoMk/NDPYfMKsq9mawTnqu6qUvm2RiJHepn2Sy
         6P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404323; x=1789009123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=fmWC6idU3fPJEHnjI4WWhZ65kcti/SSs9CHHHVPH4oHOuHwer+H9/oPZxGeinw1Ip6
         YB/3vI7hOZubQqhn0voI0ATy07JgvU88ZKL6/iarM+vHlVLAvlK2zhCypiGpUXlNRn3u
         WB6IBSZ0Xb3AVMyEgnNoUPOCaGpp6/On+JtVhcSB1AVya8VqwGKobJFOm9jw0xdH5zvt
         0FQG6FeTo5smO45Ywy1VtphFK8JVf0PLPP6rPRrMq60xfsSF8bO9xBKSZVwI+E5VChsn
         d3cdEwOJMH7F27807zDBBc6UMEE7atF8TYtgdK5MXTV13/CMwTuXAlGreU6FVl14my5+
         wb0g==
X-Forwarded-Encrypted: i=1; AKwUvByG16ozhzKONIRvt3s0Sa5BcC21oEp/5oh127n3WMQmfrEJ0BXOI26E/8pR27mzkAUho+aZXREjpFdvPA==@vger.kernel.org
X-Gm-Message-State: AFuF++lnOiG+jrXb56XV+YReIGy01YHeUfy3tiUDu+mEbHJeeq2w5n8o
	2LRissZy85y1fVMrkM2zHs0GuCNHcg4C4iMSS5gr3lDzeoaILIWsBm2pKjYqiEM74W8nlG8pkcM
	kIOodj/ShmsWwc2cseJE9jR4UZqdEGgs=
X-Gm-Gg: AYBFou2H8QpmG+dYdld1N90OlRLJK2uj7q1+7zcQjZotcdKCaZg6AMU0FFor6sM0qmk
	FAp7viNtbBAv9gO8ostG/0Dr6A7kap26sIU2p4P/DpKcrsC4++nd8d7AqOExLIz53iqtheJXPAa
	18kpM6TQ1apSh3xZFyIALAdjaTGnTuWv8Ngcx+sBIu9U365mpJBzYYOtBXbjBTaZFwX3VO07xyP
	+RMG235mf6a2Yn9gFh9V/buGO214A5MeiA6iyGadPJ8vpOIJApJw9A0SRmqDqgW+x6Qe//k2q0O
	7Z2bMoPCTa7yo4JyCGTaN+KoiEwTvCU4NO3OBuYDjBRKvR8T6Tcd5bwK8/G+xGd9xZVe6Wk3i+I
	0cOq9U7a8+QvRrcIJeCGkw5H/r6XDQJZ9n4qGnulUPoh2SNie+oBfOnXqzr2fAQmaw4o0
X-Received: by 2002:a05:6a00:10d5:b0:852:38ff:b4b6 with SMTP id
 d2e1a72fcca58-85ed3f6cd26mr11933247b3a.17.1788404323051; Wed, 02 Sep 2026
 19:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-3-phucduc.bui@gmail.com> <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
In-Reply-To: <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 09:58:31 +0700
X-Gm-Features: AcwNN1U5zeKxmI35EGDwvUZzgzhqsl97lW_cejqy0aA9Qkk84c4bJui1c3m3NJ8
Message-ID: <CAABR9nH5dcpaxDSyo3jjimorTJ35nf_OjFF067Mr63aiCO3Q+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the review and the suggestion.

>
> I was thinking off a typical teardown procedure - everything is permissive:
>
> // the disable path:
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>
> or, if one wants to do this properly: split apll1/2_mux_setting()
> functions into:
>         void apll1/2_mux_disable()
>         int apll1/2_mux_enable()
>
> You do not have to go for the split, the first option is just fine.


I will follow the first approach and use a typical teardown procedure,
where all steps are allowed to proceed and any errors are only reported.

Best regards,
Phuc
