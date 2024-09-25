Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EC1862BB
	for <linux-sound@vger.kernel.org>; Wed, 25 Sep 2024 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268085; cv=none; b=TSWeAMkNwPNQHHpi8mhD0z5S1v7MgcP7UN7jcZS9WE0wTX8eKqArjIk4RlzObb03D4FQDG/tGfzosqX/youuNF3Ark5cXsJAs0B75Y/wW3B0ZOAbZlet41rRi3/PNXdmSmPbI5oksZg21rzul5VzBuJ0+PCt/NcqNPQzDaO84pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268085; c=relaxed/simple;
	bh=YhBxDPpYQH4YqwY+Xz5yX4fHNoiBzWpOpC0HAJ/BbGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LFkL7OLx2J0A53qLDqdjXYnSY/NcTnyiYnUJqIv3Vn373tlZXnFAKrbRMR9qMoIa089nQkYeQPXHu2WrLx2kHxfIhX0rgzaVaJuyPB9iltwUdIbtAwaIGz9QlF8E4KUcCuLT09mxACJJKKNpMoSvNxCxZP1t6xS8iv0D/tSHD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQFotCNI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQFotCNI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a90349aa7e5so978055166b.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Sep 2024 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268082; x=1727872882; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=DQFotCNIt4fwuRs9KULT/DBg+n0AwQoywoUipZtw3TLpQIUBa8t156Hscy0gbLplGO
         HeH5kaHPPr9Ba2K5nc3YTD1du7ezVFjJHHN/qU3qt49/TPfh5GGonPVZmGFmkzGzkQ8T
         /oYwJELE0kSxtpC6OjbUZhRx/kjExaFwtrsdZB5qgtVrt6wEfO0glyDi9IPcKFdSmGSG
         MgFnkCqbV4h1k4hXGC2Ox3JGI0KaxiIG2SMtOwm6vEisFalQkn6TeK+aO72yzt2qPHFs
         ITcsxnS1yOJR1coJPFsXgN6fdiMYXzH0/H0zE8Yjh0azmQmlxXjg+Ots4llYx7kGrisp
         z18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268082; x=1727872882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=mWn/Gn4iER/3mey8Sv3mLcFdqTcHY36xj6tsVdj6TegGn7+C411u/SLzUiYXGblTnG
         B80dm5Da8unZjY8vTR4X7Ce7s44XdY3FSqACwZmV3kGjxhzjgemjcOCk65hCFrHb9Umk
         cTw0udxZazre7XdVap5SwBZz81B9mlAG7Ctn+b351vXp0Ote5YDc8QDXzmm8TpF0ELzU
         CnhdRHYgdK5r41abt2+zy8NAHR0iBaIxQozsyVIWWYWf6Z6MRgHrBFPv497HuP5Z4lH6
         svDrfW+CP8V6BVjLIxOapqYGBmNWw6DWX5fphJo6S+mBvOf5AFI4CvzhekyHwbowEEhg
         n5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUREHHtYPLb9c4rEv1Whr2Wv9f2ZtWonFPR/o/cY1kLV57Cfh5HOzXeUjS2CZ8uI7wX/YNyqBZQtE+QMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1MUU74tPOmZeRH+PGD8FREIgQZkdow2oUHShzqksxvt0Bys0s
	M4+fbJcow7PPMf9nDE0QmMLFaMNnFVZuagImIe06tOOYjxXYddSTaUaiPVNR6vo=
X-Google-Smtp-Source: AGHT+IGWq/qS81LG8YAeWtGigBWFGSY2KUCD3wh8z6b4HsLNJ/KmQuRXg4EvkhlOqLo8SJiXSmkn7w==
X-Received: by 2002:a17:907:94cc:b0:a86:8f8f:4761 with SMTP id a640c23a62f3a-a93a035ff85mr249552166b.25.1727268081819;
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm204615666b.120.2024.09.25.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Sep 2024 13:41:20 +0100
Message-Id: <D4FDFLNQVSLD.3GSWD0IK7Q4FK@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <a39.skl@gmail.com>,
 <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <vkoul@kernel.org>,
 <klimov.linux@gmail.com>
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
 <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
 <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
In-Reply-To: <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>

On Wed Sep 25, 2024 at 9:53 AM BST, Mark Brown wrote:
> On Wed, Sep 25, 2024 at 11:27:54AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
>
> > > +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> > > +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride=
2)
>
> > This is a nice hack to rule out n=3D0 and n=3D1, but maybe we can be mo=
re
> > obvious here:
>
> > (0x0434 + stride * n + (n > 2) ? stride2 : 0)
>
> Yes.  We could also use some brackets to make the + and * precedence
> obvious.

Yeah, sure. If this approach with stride2 works then I can update to:
(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
and update stride2 to 0xc.

Looks like I can also remove:
	if (j =3D=3D INTERP_AUX)
		dsm_reg =3D CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
from rx_macro_digital_mute() since INTERP_AUX =3D 2 and this if-check was t=
here
to handle special offset of DSM_CTL for RX2. If RXn() will generate correct
addresses then this no longer needed. Or such kind of clean-up should go
into separate patch.

BR,
Alexey
