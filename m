Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98664E73CE
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558998; cv=none; b=MFTCmoP9+HnlYhzIgGsqBti4AwHmfBoNnSC26X7mrCVrh12R/UW6e9+kEnWSGz7EfpPnT7YOl+U/fpo0IUpLm7cIWziZDz1H1r4AtlEa/r6gpEeDF4fMnwwui9FI7UschJJusuaVVFGxp/sRTKrIvsjpXg+MD3w28Uznz2mBDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558998; c=relaxed/simple;
	bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QCch3CBYAdtYSeTvaklaWRIjAS8YRyl1+1XQeNSP61v5H3LZe7k4Pdam3zYY4ReGAEXn9izJn/ziwEsFWx2ds1bLVmNUvInLRdrsOdYmxyfE/mIttP/TBR7k0qxSk9AlaKkW58M6wQbxOBUWk3MyfVQgFKHih55p35OWFYFRbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LMtRaOke; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LMtRaOke"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c262f1186f0so600465566b.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791558994; x=1792163794; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=LMtRaOkeyn9vl2q3+mxGBqw2kTPPBgIP/2aF+Zfw1a3rsklLWnOl3FiTFmej+J2bn8
         noT9U7KdfWRliQ0fsIu2GbI6QhPyKALhQr8ltkkTpBCLSP6Fsxoqo41zq/jRkO5cPZRu
         /hwLhHr1s6ig/lrTez5fvU3FcAi1sJyfEuLtGuj60nXV4mK1v9WmzpMRw14cYRn37WiB
         lGUwVZjDPoGfM/sN2mSlRzS6/rfxnRqeqwsZS50mgtNvqqOy/NtZSDhihOTfIXTEDIdU
         BqhYDfO15S0dr0WTtDhfuEoxKbLYVRaLjObcmHALYs65YQpem+OgPl0wW/+68E25JIeT
         aQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558994; x=1792163794;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=Z6avIDZzrON/OTpt14HOrtYqrH99JoY794RuidFBppn4gDooTqQafU87LdUak9L9Af
         YExfvRzVkXzE3pJcrrM7UdU8mFZhg/LUj7rT2VbKk/DToxHNOBQbsMpTFZr+sPIJmpFJ
         6G3t75PbAtKxxq/FW9rIzgBiln5vj375PN5jkd2LtzKURb55kBGYTldQckjA5k6J3AfA
         iqeh6cZD4rvjkECfcOGWOTyTMpVhzgd+ETo+iGA/y+ORY2ICIDmKVlCrZGD+bsfRWGC8
         I6muR07PJpkhivFIj90Cxdhr1Dco4e8oN8qO+jJBtUOKD3OWGm0he5mU51lsuK09Df2J
         3pgA==
X-Forwarded-Encrypted: i=1; AKwUvBwKyNIMVY70H9g1p59vXrLgzNREWbKZ8e3wbNecxBJTsDwvjNG9NgA+FMuXXJ3v3kHFt2yrwvCGVDSVwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2rN1X/52CX5j6OluBFR6lDL8VRWw5JOUpgcKZXwMs87triL/Q
	zIQqGnOgtKVycTLgcTUDao5Otost4+r6tBz1+CAwkrRzvkXWHYAAQDYBwO9RfliGpOM=
X-Gm-Gg: AYBFou074rxUMrZisZZZTM1Bx8+1xcc0Q58q495zLdUyEeuVyPEJDWBoJho3FF+k9o1
	YfBlbo+LLTE7eKea4oYRdAGt6bMT49uu1RrJJXHc5nDdyg+bC1deIPHFpJA/Q0MjWRJ5ILwRvoE
	yXb205z2Jdj1/spwldmyrmWfP0jaws6s1ZMqOxAeRFQ6zqJNWgfmeMYBP9+z2ntxaAx2qmtPtEM
	g1eSAKONko5nj0RdtVdaNSeqDmlSrNW9goqwNi9TGobZRoyM+YulO44eppKQ9MFf8cdWGN2hm4B
	3eCUfBGMZMMtlaALngcpuvgM0Mlj70hodSGncDlnXUNiJHX9msly7IliGGa5V5Mq3J4lE0OyYPJ
	G9bcl+wYQXFO15mHOvt6fde9xctxFPgCpLlv0rkqUJGHW0SWYyJq2RNdH4vNwOckCfgITsgIPFe
	k1ZMlZ06GhKi4mSaSLSdvrI2n+VhQIOikR8007lqsr7WCs6m7EHlyXAh4R3RLke3gK+H2TgtNXv
	k1Ie5Xa0iSa4XwQAEiSVBZg7BRSEuKr6H1giYshThM=
X-Received: by 2002:a17:907:3d4a:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c31a9fa1d4amr241370966b.15.1791558993759;
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa14f8sm111219166b.53.2026.10.09.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 17:16:32 +0200
Message-Id: <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Val Packett"
 <val@packett.cool>, "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Jorijn van der Graaf"
 <jorijnvdgraaf@catcrafts.net>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Mark Brown" <broonie@kernel.org>,
 "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
 <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
 <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
 <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>
In-Reply-To: <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>

Hi Srini,

On Thu Jul 23, 2026 at 1:02 AM CEST, Srinivas Kandagatla wrote:
>
>
> On 7/15/26 10:19 PM, Jorijn van der Graaf wrote:
>>=20
>>> This week, I will try to pull some wires out and check that on my
>>> hardware too.
>> That comparison should tell us which side to look at. If your board
>> does drive the bit clock from the vote alone, I am happy to dig on
> sorry for the delay,
> I see same results as yours on my VENTUNO Q board too.
>
> As per DSP team it should work, let me dig bit more and see if I can
> find what it takes to enable it.

Is there any new info about this? This seems to be the last blocker to
upstream Fairphone (Gen. 6) speaker support. Without this patch, the amp
doesn't start up and audio can't play.

Can you suggest a way forward here?

Regards
Luca

>
> --srini
>
>> the milos side; any pointer on what to check next would be welcome.


