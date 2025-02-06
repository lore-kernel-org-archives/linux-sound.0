Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF0D1F60A
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867576; cv=none; b=bT7RRghS2G2Ouogof+ir1vYDCuZ4cF6AYuBq9aTrQNu6G4d4pKDjAUkhTLUqKPVndAJcNvna2va0d8KSF8P8DSn2MzbO0wt33CzU7cfI8mTBu3KAdbS+O4RTxR/ki++UIzlf4DwL6vAIFw3loCB3SiPs4Zw61twI5vy1WBubcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867576; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqDDMoFuLTDQ7LImdxx+OV7xDsJetFJs8VlJYmkPWwhL9Or6bksNLk869mTJ5670tfpabx73N6ghx3N+b9AUfroxlIKx3BRln2x3NGkr1iby4Wnm3aQwk+DtRtgqZjIoAmrnwq8829HZXFbX8fiwN/auHUIkKUBuTRY5NIHKMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CH4Zibz3; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CH4Zibz3"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so11961111fa.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 10:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867572; x=1739472372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=CH4Zibz3rE/F8+bMJiLzPz9S648Z2CCcv89XgbX1wwyiN6yPAERszqO6a5iBq7Z/D2
         cBdLYbFcA3laP1BPi8GqdgP4tKrvkBp0UlNaVBYUQKxKm+3FQ7kzyQ4I08q1+9wCffGq
         yX+CW3LVwHS/ifU6xvcAAHXEhpf9I3AFY4R7uLqnrHCHS++ZPjE5PXQWVztZjDGbJ6vV
         obSK705XFKPpSXCcq5DhCmaQ/Mchv21LOwNQDFmwO37qKgUGhjcFWyPcBSMcfARY1omi
         MzCVbXw/IUlFoMt+DvqHRiNTGPedgW9SrMeR4H7sR+8P/6+vezHA80xcbaORMqKpd9c2
         YC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867572; x=1739472372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=npbfIQQvrz9vxgQYlCYANxeCksMFSKzpzeLkd15PeQ5s1EWD5WUqV9NC5FKnhOQdaG
         ytgqlT8M37QhFc4ajUV3rwfyD75e6vLXsz/kDd+Qr3+aKLbTGcIUcINByFrqo9CC2+tx
         m7yNOs6PLkWuiP6Xo8y2F0QF5uDTzIWp90SGpGLN7ofSdVgCn2vAGQ7JL8aoYW5IsbKi
         F0nEnBD+4ndAoh+2h+l2pNniPNYAKXYYWkptYeircoNIIk6knaGz9qgosjE/1gqd70ns
         vaQS8Pqlt06abvl9zjM9xfvIAa+YDfQgxX2qfN+zg56PWJdEcmk8zN0KNyBJkXYfvAt2
         3QSA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LX4wUT8JWJunBRz9Hvi0DMpZLFc4X09Up1d0k+lNtaGc8ZuGNFeZKwtYR4l/eqSL4JaCpAEQRvUDyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjas9i4cIH+LikhAcBCUAmntdwx6unj8zwc7lkTiRKGfqfrb5o
	v1i5Klbga09rY6yucv0WYjRa0Y3BhpXzi2uBTZt9GtrECisjSATidLSMeMgFUmp8Cmc5LIn8LGu
	gLBNixy9FMEmaMNf7yUJaog0TdJfu3FcslbHwiA==
X-Gm-Gg: ASbGncsmAVKCL/dRhq9lMFiO62E2ij/nzyQjoPCSY/V1oDMtJJeuaamD7VIAOg8vpsQ
	Q1wkIEl4v6Av8UHh8W0R4qWTc+I9xxkkClnsIj/jv9K1jVZSHcUF6OSUO0HtRD7D2Pn+QeAI=
X-Google-Smtp-Source: AGHT+IHBXbEvo18HjmPufvQO4GaXJoRqBewEyheRHSK0Q9zbSI8UBYUsHoznNfcnvv1UkIJfoaGthv9VJSF8FinRDdA=
X-Received: by 2002:a05:651c:150c:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-307e57bfe60mr399971fa.2.1738867572121; Thu, 06 Feb 2025
 10:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-7-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-7-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:01 +0100
X-Gm-Features: AWEUYZk4bNNQBgH3TVFhlaeZ56ai3rTQMhsJjvQoZClT9barbrFQxRtMdamD3iI
Message-ID: <CACRpkdbDOH4gRcJFLeqhg1Aj3BR_SC0_1Odbi4vs-Oi70rTZ9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] pinctrl: cherryview: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
