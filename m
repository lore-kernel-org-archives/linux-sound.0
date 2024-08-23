Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CEE1898F8
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429534; cv=none; b=m6YeFQKGqyGhenEl8IRlJsbI42LrtSOsmUVYQ7GZJsXmt6fJeUcnv58+z3pLWJWcI5kxw2yd5yK2OnWJxqjFW68Spg3qKZuZGc526v1uw7iCa7x06d1N9tYQtfqn+6zD9brjnn0zrPbRBvDDYy20sWTu4QqXRluhHp4Bx3HV9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429534; c=relaxed/simple;
	bh=x9HeDgtUzI85qaXdWmBXNojHvmN9gKIZ55AlN9BnnFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtcDpd8rahoqvshkO8m+5YDx/nMMrnln8uwmt1uDhy6JxeEceu5RM1QyMrcbWDaaEGmbebEwUt4zd0XQ/F9e9Q9nB9P/ldyWyUSVUlTvNsLpwXd6yygjx5l/8ck2Agb+ghnkqyBnit6Fb2w05Xm3woazO1nwNaoRhCLuxBhRudo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SW8mP8ci; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SW8mP8ci"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343e75c642so2260e87.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429530; x=1725034330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUtJ+oLA4esiCwHxzR1PJ9WRsZLpLW+urZuZZ82HGUY=;
        b=SW8mP8civONpsBVASNaU+8nXj9ShrbnaRU44Oa4Q/1xfGRdAucLAQp0rmV31HZC2LN
         KFFXXfSAorBnPJMP43IXBMYWUNd7B1499+iQmAlR6/KoWd7VEtUy8YEinxrrCKSx0vD4
         +KrWeDAOHxtzdFjfCp6b3W4MWuSiUsWH6P/7VJvJBgZGCGUReKwi/mAm0FrVy/jpDh0o
         qaAk3BefH2PTXExUYsewvWXshCe8hD1sqjUEXZ3VChiNFDV3U5Z1N2w5AYJGyUANtLEC
         Bw5MU1lRg0ZUU1fZ/mnfCgAcnmAwL7Xuin9Y/EYRiWYJPBk8VWm5SbD3aeLcgI1sXy55
         9Yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429530; x=1725034330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUtJ+oLA4esiCwHxzR1PJ9WRsZLpLW+urZuZZ82HGUY=;
        b=dCNNOrrC2aBUtGz+efunzVRaEQ7HeVXYCuEr+tx9hUtQ4uiPABwGsIK6498EPKxUyT
         rZqj6IvGs7UlYDtufB9wBEPC6d+XQoRepLRueDibhW0OCAOxryzcRZXlw4pD1J/m64e2
         KZqtVyCtV5cFU1z6yUCxu89u2Fz8+t+pbhI//lFsW7gjC532ek7Js5HnFHHfnKatiiim
         aGHLCKoTOdbTjwnJ0v24d9DSyWX3Ro4orF53vPSYZM7vjH5uN3TOGNK16rikkDkwzA+7
         bUA4F7HjRiwiQbcz15BRR7HRqIQXwOegWJcLDMk6up484ZZTNZBtHrQHKRahd0LoJ/gH
         g0bw==
X-Forwarded-Encrypted: i=1; AJvYcCVfbgl30b/yEmQXS6fKrteT32rH0hkyuHFC/TZkBrAQgzpelJAFAlmqp3k72ZcZUa1V3clNSoPR4xTNBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCD0VfhX0+XzuZDJ5FPDz+5iMS2Vn/4QLKFJNV9fk9qZ38gMyC
	iXGv4swYScfL372FIbVdJtpFcB+i1Cs8Dep8uPdZyitBn4MvMr+IAl/uTlRv/MYe1T/ougvlJ8i
	U3SJ4NbpuXoUdjt5A//mxanpXEKJv8B6QZEuUZg==
X-Google-Smtp-Source: AGHT+IGGfa4J6/rrOmhK+K2Ol6XZFt8xdTBfsTGvDz88zJF2GE3+F2dUfKvoePIHG1HbHuE9HLf0FWj4ywInoY22pyo=
X-Received: by 2002:a05:6512:234b:b0:530:ae99:c7fa with SMTP id
 2adb3069b0e04-5343882e2e1mr2006824e87.10.1724429529236; Fri, 23 Aug 2024
 09:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
 <20240811-dt-bindings-serial-peripheral-props-v1-3-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-3-1dba258b7492@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:11:57 +0200
Message-ID: <CACRpkdYyZRVC-AYfpTG1f6sqrqAg0pCWxzUr7eXYtnM3jacMfA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: bluetooth: move Bluetooth bindings to
 dedicated directory
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johan Hovold <johan@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Kaehn <kaehndan@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 8:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Some Bluetooth devices bindings are in net/ and some are in
> net/bluetooth/, so bring some consistency by putting everything in
> net/bluetooth.  Rename few bindings to match preferred naming
> style: "vendor,device".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Excellent, thanks for cleaning this up.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
