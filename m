Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ADD21D3ED
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614068; cv=none; b=kJOUHObO8QWX3crZUwVeYQuP1adsLWOl4WpbguSqc+sOlllKzj6crz0TtbaRl6MDkjU3+EFlruhSonzc42TArS+OjVRb27fPWEi2jqrcGY91YNhXHn8ntPxg6MOCedldVmrpzbzP9xdEGzMoXTOnz0SSB42yeyQgwLneZXVWUfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614068; c=relaxed/simple;
	bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FjjdihN1i60XU18E9V/+HHqAsvDp2dA57Tt7ZVEfSW2EGk7mC/sX0//GP1UwF5G6S0v0eve3DjVGO6QTyAwrj4kUHC9ESShAevigvsqo5sCbBd8bmpH6SSiTWAQR7Xd9/so+F76YQ1Hup04BRhFCmbTe4zOZ1Py6XD6ArT3dBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iobspATP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iobspATP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso19044045e9.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745614064; x=1746218864; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=iobspATPfwGqIsLM0hRdkX27+Vqee4L0hK2wogylTQQQC9L+KpXhkA5f+ufUH071k7
         qgJ+/c36AdNxZ+cdMkrDE9ooQA33mTTGNqt5WcH+Wc0yI1bLLLdPvR+8RR6eE1ja1h5I
         W+H7D/iIG+hff2pOE3PUh+2sGH4wo8EgNreZyL7jTb0xgL8hP3WvmQtCOV+5Cr7fqU3u
         //Ki43jNqsfiXc/67oMwWU2xrQT6OPXwdPjTt8pMf80P5yrLIVscYTBJuGsgYEuvpEai
         JKUXTf30k4vhbfxVbdV4in6mRewfa6G5fUDWy6ptcbwej9NsfGrL2C6+unNLWv4pTE9M
         HrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614064; x=1746218864;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=JHgG2uIEA5h6Gki7DXKE3H0ps4J8wYBN+HHTIWKwTpqfdXEi3HTsnoZGJ6GHydbgZ9
         OPXsQTSX4cskw3h5uLv/PF1t+sGYK+xtVQC6m0WIDxAzNP+JRCeN/LMAo5D36BiYNFRH
         q1Z/H0/O3YzB85p2KpJO2uppMKO+TgJAZixYV4vetBYahi7xevl7IOOg0RWE0iXwyZT6
         XR4wQJWgkqTwc6ZwpFXUTdf9hmzJL1PS3OWtR2ZlBd29yNL0OeTg0LBViMCW9DBjtrkB
         Q0bp7/ivbhJ4byuVOki9FParsqAmYt+fpXPxvGZ2feyjlLuiYqgU1gTooLhyodUhZVOK
         Q+4A==
X-Forwarded-Encrypted: i=1; AJvYcCVzZI6HsPtq88DBIBGX9cou9T6dFq5KCOF8JEqYX9XWb/tMrUFVoWAQNlCpYDaQbOJ2/jwJ4sT43/t4iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDLYppaXC644avRy/HEhaUkIxYimNUfoYCusJsKT5aSR7bYFT
	13niPQQWlorzhbE8trUwcNCoyjtnWRzrBxZO2KttyvMn5Rw4J7RIpUXedwHZ9SQ=
X-Gm-Gg: ASbGncuksljJnt+yuwmUwD8Blrnu4IvVv5vHAt+7lfEa59sX22/wJx4NhdIF8Y9usFo
	OzAeQxNGAhfrUiGeTJ9cGNjOOPQnWItYU8/HLVH4clacTCOKw684fT+uRBaORPx/Q1DcJw8YFn4
	QCOjixMo1rc+i1awH9uUyLnnWlU3wmkjOuIUtMfawYgITrgWEceAIHUNGzGbMJV4UFo8IEzrEYU
	/PDJ6kGciMY+nxBLoDv6uIg+VpxfBsN69pnoT5FO9CSHxLjMyKoJFxiiJ+BIrszvKj20N6XAaEs
	oa4LH5nbWzNQydClJxd6Zpgp2IU4hqY3xqaq8hp5lJjwN9272nEcxQ4zj3jfbw2/I8/tONycnTh
	TeYk+iDfA2FdnjSLHmuH9S0JAYlmDQQxjrV2CVa0cVsjozOcCWlJr
X-Google-Smtp-Source: AGHT+IHc2IGV1cabuJnO+f6tRyRq8tFSNKSMn/0EAuS9gCgWsxP2W699M+Xi8my9zfWANmox2FyRWg==
X-Received: by 2002:a05:6000:18a8:b0:39f:a553:3d98 with SMTP id ffacd0b85a97d-3a074f89292mr3119425f8f.56.1745614064100;
        Fri, 25 Apr 2025 13:47:44 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da0dsm3245891f8f.88.2025.04.25.13.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 22:47:42 +0200
Message-Id: <D9G0JHKZ0RXB.3LI5UGS7QTVQN@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Banajit Goswami"
 <bgoswami@quicinc.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
 <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
 <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
In-Reply-To: <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>

On Fri Apr 25, 2025 at 9:03 PM CEST, Mark Brown wrote:
> On Fri, Apr 25, 2025 at 08:19:39PM +0200, Luca Weiss wrote:
>
>> I've based this series on next-20250417 tag, so this is probably due to
>> the changes from the USB sound offloading series that Greg has picked
>> up.
>
>> So either Greg also picks up these changes when they're ready, or we
>> wait until 6.17?
>
> Or base it on my tree and let things get sorted in the merge, I don't
> know what the conflicts might be?

For this patch here it might be okay but patch 3/5 from this series very
much depends on the patch in Greg's tree, given it refactors/expands on
the USB_RX if there. Resolving this through merge wouldn't be very
pretty.

Regards
Luca
