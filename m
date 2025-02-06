Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960D19DF81
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867603; cv=none; b=L3Wh+dOs/I1KbANjDMNDtFq6GLJ50LtVQFYrfi1GCc3rAOnYPKTRhe1cuJGdfcdNNPZwhhS52ibG1EZ6yiW1XP/XBO1vH3oxf/YHJc16hElajyIqa16s7jxJplSKdtNqdxOGUOsU0TQOenBsrVMXFBIlc8b3BuOQzix6VNJbTAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867603; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAdzxJq4NGZUX/bOAIEkUvMKvaCURYkCylTpQ2JUEje8pIwpuZTFa3NIB3ZTMQaqgHIZ2M9I+bLhNRm5a8APuZHysx54IykVa0oZKoXoyNhUOwKJgkuRpOfa+/Sw+lPKrClMtsfI48h2t9Fkm76Ke2LB3i87+ug6bE/TJh/qh/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSb8bKjl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSb8bKjl"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f757134cdso1370654e87.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Feb 2025 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867600; x=1739472400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=HSb8bKjlCso8Q2T33K6TqG78MC1pBc6iML9i+BJ8Q0DgT9npYfT9ppCDFnD8y26dIO
         q/bS5EVPVi0bwLw+Vf13weupn53gFOnG6j8UZB0r6mPsrIUzmM9AMXW9Q1sWhpK/ZvXe
         pUpJUj+ITtePG3fvDFxFRoc60DY/bPX6ssJ/mXBpmZ53Aa4ZMzX6aUSJJVaXWRm20mkV
         EL3ZyJz3zSio1/7DKWPuAWOP4VahXA735Hkg9ngvlmFLp0nr/wwFT8b7P35MVG+5q1Cf
         8lKMd53PhI0MoiAWFLrBlsoQpNgt+NQIFrH9x1RGdk96WrLI6MY5DU9xsUC7hG/UFxFa
         6HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867600; x=1739472400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=kkci7z15WHDE6iNrRMg4gm8yr1p5/PonxczuOYZ8Qf+0Ufb4CEOQ++Tq4OdXtYwHQ2
         QS9+fvJInJgWH4KaYqzBdK4BGQ8lJA7OpUXnmBAP/AQymEX/UfEGCRjyajLh3TeLbrev
         h9u+Gp0k4EaI4upgSo4I3uGS/KXu1WwuB7GSIgyx4JnZXeYvicUfGEBxT7U0Za8tNEpw
         wMl2yVa40mZX/cVPEuw7qd4LSTKX/s+wNGsq/HH8OOyKS56wQcYXlRL8EEOEiWaXo3l9
         jAgsU9bzETnFjOV2OTfmyXsas4RrpFGhVP8oZ9KxTxsslPeI5EAaBk5lr4zy7+7+LWz2
         sQyw==
X-Forwarded-Encrypted: i=1; AJvYcCWFlSeEtQOHoXfN6dwhM9BKtgc2cofpqQ2GVNJW2Zjn3MXwgDtjestU2JhPCrypDeqFIqtYQjo8RhCTjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMacKxNNL7NeZ4afBMO/M0fA67BWjVAegutwFwQDZx2Yl3rQJa
	LXs1T56bE5DoC4cB6IilanVQlH0V5A3wOaruTpN6y1O0lRVdRI52xO6ZkrBsf6LAV6QqqOehPh6
	a2D7hAfgUmL+XVpoonIfJNaFoqiVpgmtgPr0kGg==
X-Gm-Gg: ASbGnctrNPCod5wN7EVp/T8/wCFMFkVEO0sorzIHN6iDnjwO5I2b6iaGCMmcE61MTuO
	jj+mjgHLn65+XWT13gJycci4ldN9SpO5Wtc8S9zioSGKDCubgj+HPgyfbpi/zF+5kJRdnWIU=
X-Google-Smtp-Source: AGHT+IEpzVZeWcxUUFevUxXUUtkE4eDoK/ekTj85xIIJYmnvT+leN3VUeeipd/F5aigtmYFlfRv7++sKlMafMRpOAt0=
X-Received: by 2002:a05:651c:548:b0:2ff:a928:a23e with SMTP id
 38308e7fff4ca-307e5a7c213mr216161fa.25.1738867598438; Thu, 06 Feb 2025
 10:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-11-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-11-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:27 +0100
X-Gm-Features: AWEUYZmP4B2GJCmX-AuJOGL0VPK6_mEkpxI9o4n-GutRcEqg2kbz1wZ69XnDlBM
Message-ID: <CACRpkdbKzZ2WWEOE=ustPhL9GjmN3tkoAsgThW3ei7Gjstbp4A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] input: ipaq-micro-keys: use devm_kmemdup_array()
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
