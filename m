Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D12233133
	for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694693; cv=none; b=Moo3qoPRYK3urDrdYnvbVcOJDqTfRiXUfopPpkDj9fsNEsRx0GgU6GEwWqOtfGduJ9encgKlgokQv57zcWsIfDrIg1dsGLwUJ872p2LQWyDH0VuHj/MObEgtS7pCPz/mEct6lElKtNheSbL8tc0Czt5bI5hgSmOtInBoR4Qzq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694693; c=relaxed/simple;
	bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JFbFeEim6bcmPLDtumrvTUMnSaiSVL5U8JgcTqwa17LtMBjCaUDLiLfh6BtDKuKqLrLWIu2fO+Zjrg/DU4hYbIxhMFKat3XVnuvhEhULVrJfRabvKJiFt4UO5M5am8r83aeivBWVTviZDknRPx2EkRVfqJvaTtgUtqUiVxHcWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hnRqEenl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hnRqEenl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so687955166b.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753694690; x=1754299490; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
        b=hnRqEenl351V0jKU5o0FexJPeykocfKZRvqd3XPdnk3WxuWZwK00bVDgumZlsDIuYA
         qZBZjSv6nK4+/lxPc5uQC+3mJo0azz2pQMt8MS2MFmThRbPXSOiBQPBSJRH0R+rcay62
         2hLXp2wTfLHQxL+CJMqWzNRo/90jUrmwlLVfMC0kIEOtDk5qQT3p13mJEG6WW6ZT6NhT
         sbjSd7OUW5whJBGK3H09wQLtbxRJ+cMOhjckpcwt9x5oogSr9YA1k51d7HI1EHDDDz+S
         GuZtAeqhdxjNnC0H6GqZbWsheZ00/JaiyAubXrB6KWTN72i7o6MQ14blYwMBf1V650sC
         mBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694690; x=1754299490;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
        b=tWIzLrjvA/rq9bcI1vtAxvLQGdaCPKH+oiFJkJfX+S3uCXXanXeDWZmaaP2QI6i0jT
         +ZKu6H5AJBdLhpwgHDOBH5oBvaCNzWr6qel2YlKPxn2Dq/dwVW7E8DRDBmZIvFuXzxOI
         Oqssap/1rt2YqUq9x6rkzj2Yp7pAHqvgBfMCcedOkPOjVZVKQVhq9d6qnpykF8SrDyWA
         C2XnHvfF9FO9vFZdluRAO1G6OGxKF/n/ntcN60td+S/o/ipRPtkIdsjlLzdcMO670oPr
         Y/1ziLyZyBbNpaU2P0kE0nu4B4rbus5ko534We7crnNKdvXQ/63u+M2GNnnMRni+A8tO
         f8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCULC2Qg/DhZpPT6/+dY8NKSLIGwM6o6PTohYL5mX+bQh6gTWhO9221sEaYb6neC2QibyOrzD8ezHUE/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFw9JsYFBzdrnNfB6v5BQv6yJ7g1jgDSowyWhxfsRBUp/liZg
	1N4hiXJsswo/CTyguCCwANoeseNDXMXDg7RyxGZdZQ8jhkvIcEk0nhd7etpBduBqeew=
X-Gm-Gg: ASbGncvcvYpuoEru7lpc7mFimA1oc/wMi5hMKZl3kkkwGcRmYNNMY0CyU48XoT9bSol
	7B16hMBXqpMfesDWFZ7QpWWAqFAxxn7n5T38ti0nGhNJRJ/IxUjZTJJ8DN2RIdsXRBawOc0AoI/
	iQh9J8wZBNkPVsewz9fyf9M+WMwncrE53bSkkwjblWNVT5zJfzAYCtvdYmoPHJvGR2Zr31W5Vsm
	dzm/0aCaXRScxelHFNuFxh5AfmvrSAd1hmNsbBTC05DN/qVqSvABfeVo4HUgAJhA8kWn+nGMJ5D
	QkUTVwbNasJ6InRKmOyMPAIs98l/xxDqMzv1TIgqEygsefeWaxJfdlOB6yfKS+CogpJrVWY6FBR
	PvNYavuALLeWB2AXLzjwz/FUrYBaxMgwWuQdxyuTcKbkZnVTy6cYYhVC0Dik5YEOvMs0=
X-Google-Smtp-Source: AGHT+IGk6lrYnsZId9mCE/cRiQIVZNKCJUyZ+AEWNPRvXM5N0BY5nsGMSTWyTaZBxtJaa8J1biPu9w==
X-Received: by 2002:a17:907:e2c5:b0:af2:4429:206b with SMTP id a640c23a62f3a-af6190f8b0amr1131320966b.33.1753694690008;
        Mon, 28 Jul 2025 02:24:50 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635afd811sm384349466b.136.2025.07.28.02.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 02:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 11:24:49 +0200
Message-Id: <DBNKVU7OQHNL.12Z6O3PI6SHGU@fairphone.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Cc: <srinivas.kandagatla@oss.qualcomm.com>, <srini@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
In-Reply-To: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>

Hi all,

On Thu Jul 24, 2025 at 4:24 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
>> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> >=20
>> > Qcom Slimbus controller driver is totally unused and dead code, there =
is
>> > no point in keeping this driver in the kernel without users.
>> >=20
>> > This patch removes the driver along with device tree bindings.
>> >=20
>> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.c=
om>
>> > ---
>>=20
>> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
>>=20
>> +Dmitry, does you computer history museum require this driver?
>
> I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> the driver would be actually useable there, I'd prefer to keep it.

FWIW on the WIP msm8974 audio branch (from years ago, unfortunately), I
don't see "qcom,slim" compatible being used, also with no change to
drivers/slimbus/qcom-ctrl.c.

That branch is using the compatible "qcom,slim-ngd-v1.5.0" for MSM8974.

So at least for my museum collection, it's not needed.

Regards
Luca
