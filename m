Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C830B536
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758062; cv=pass; b=F/5lyk0vZevpgbne7XqCrVy95vPdPda2im/XNaL8nGqX/+wnIq4febT5iX/V6IPmcMqxURDI9rr8B1UQM6uxxD4l53Oj5xClLt2Lg6xeQVOSyg/jCYrKXv1SvDor/m7j58ClcYvzHNeOCOkkdudamWaY/BUxBJ95V2fXcykLgIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758062; c=relaxed/simple;
	bh=phbd8D5r3XvJehy2gum6zA4CTU/Osysv5H5RyZZe9gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwLdzFKHCd/9S3+tKbhvCxWxx+QA72dzDVVbd0JbPl3VlPIc+8WHMqT/rB9u3O1JoPeGq2kHqMkhnUWiATOuyM2zVBYWc08eQDAjcyOSD64vmJCaqfsiKChRCKtjvqhV1GTB/2UbouoBNHxfyPOubA7Pwh808o3dkcwBLr14dHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDEc1f/Q; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDEc1f/Q"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1248d27f2b9so2559233c88.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 23:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758061; cv=none;
        d=google.com; s=arc-20240605;
        b=FtK2BdtdVWAi7u+YPy+DQswrEM0MFPBi0IeYBB1+cFQV3/cPJvccTvsWgWKzdkigAG
         0beWwWjq4RujZtdlzxPavURPu3kVuvi+83Mx4pXlZdITjpsXewUjFLZRCSiIxAEwyyq1
         tM/tcc6T+83SiAoy4YHDEYr4LVz2DcB4PPCdyspjOotoG+NhCgiaCszfQhwvMpXZWtLS
         ObRrQQ8pJv6h07v05Mau13befeyu+mj9QQtjDosgZcM9pIPJfU7g6XxCphejMm4lg+qJ
         N/Q6SdnTmvjH3fwjCqwK83kitYEXWqL6vy4IkF8RtJr/t+4rLzrE3o8WmTfNlExzlLai
         GojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        fh=f0K6shi3CX85udPo0xpq/6kUpW5Wwarg7bcdpdddaZA=;
        b=apzJzD63PMkd0ksutu59lxKfCFcsa7Zkn87vRjvk8fAayVv2Y+d6PID72zsylz6xd4
         DXCXRCh5DKWfnnVt9GUsDvOQnU2R6XeVznbb7g8kmBXXQByNq9pOY23U+VrMGBAn4Fi0
         V9gYVpyeKOjqzVaEoOWGMx9nQ/qV9NQ79SWdOtoZv3bmrl9jtB52eC8QxmY9SfhUg/Oj
         2S0XoAvPYVhkzIOxFRNRRJg+mj7ARXqFb/diKa5PNIIrfz8t+kIaPEeZgK+zdd3cpErk
         fA1KBPhiykKui22Ii3aEhfPNzU/P14MBbzp4k5OUQh2P0zIYW2nLYltb8dzIGW56Afd2
         nISg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769758061; x=1770362861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=lDEc1f/QKXanzY/hYYKlneGIcYT9yFVOYQK0N3pwwa+JfbqtPj902GoeE/L2/AwqOI
         e5H85ELe1B5kCyJYNrwqItBjYIHV4693fLsh/hEdVBo330m6fWkoTQS5x90NPT7OYqnD
         xcPF2VH3w60lkkkrNgbQ8JmZTE2q+d/+7XZik3ut9kK7dCYZ2RKccvvf6CkYZKZsulz2
         9a2MFGIvKxH6ReQ376emjRcXRu0saVLxhbIA0ejE601Xg1qvQLQlj/0v9kC+dk28la8w
         8GfAAj8wPvpaF1ZTdD8W6vbRRmxxhlhY+E9L6hHF9zgxyf1DiPYxRRF2yhAh3ISMg88U
         KZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758061; x=1770362861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=aNShE5XFY63xX39IyfjlDiNGwvacqmgoSziz8+SFw8or2YKHXpcMggO9kmfm9dwj+N
         uXsVlpfKtN3aw4Vi83d6ACB0wli98+yk9HaYJx+bmp/lrP01GwV0G+j0BEFhjCJuP5lB
         fWoOoeJ7kFn4PCcDVrl3TYjfalv+Dx7LkJRWFJ92XQuY3eP5LwH9wfawQlOS+R5r2z+R
         GvMzuQvY4RhwuLHXY+Zvc0KuGK+rgezhSuX0WVDqPf3AXAvHbi22fHhfnZtDRuqAELlW
         PFg1+wYxlRDMn4k8r33XNt3pIYHHcySQJk25fwIIsTzGWnjYp/I2IA/+aWoYXtJHB1l9
         ECPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUh8tQSdqtjkub0BsurkV1gDIdjtkkt5ZCciRXp1pIoH1QgiDc4yld1UGKD574YdAWy8yaOa08SsYscg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwV47XHu/fGVw3MLlxfmR1wrp6cjfGjnDhIyCPerF963qmsrks
	QiL7hW/Noo3XCDsAs1tztYCKi+KPPraIKlJs71ZbL7YGNIF4zkiWj1ZMaGKe84sWgboM6JHKUif
	BFBwQd64JREFDwt3dNIiFpvSP9CaRi9Q=
X-Gm-Gg: AZuq6aIWiG1hCvJ9dNNt8F9gXcbXqAq4EJgaitM3D/kg2NlKD562v1xxPk/FfNbjayK
	G2yKHtGtD6yYtCacbx9lPRj95rG6JEaKtZ5KkjPpACgdhBo2G59xNQwo9wOn9R6UqVIKf9G4sFt
	tucNAI3+0pi6SkCumGRAoA3ivUorPO+vi40vIVr9M7HISvo7nJLI1FhRMLlsG2zUXVdhzYOTbB5
	Log4Vp/RJQ8qRXcwsDxOJGI/58NDnvkNcUwWUCFxQZUn/zL9WKMMQ8LTiBSCNSqZWWCmfIRnucF
	Ky4sb2xjeIybUZWc5yjjWKvTLFpZ1V3QVnCtRVCBM6wyNuiFMD+QpjPFT493mHkmVOsCkE1R+3o
	HpZi2b0ItxJYYWg==
X-Received: by 2002:a05:7301:5f8c:b0:2ae:5db9:f32c with SMTP id
 5a478bee46e88-2b7c88d96d3mr823727eec.26.1769758060694; Thu, 29 Jan 2026
 23:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:27:28 +0200
X-Gm-Features: AZwV_Qgjn1kkHIU5h0wzpNnEdB_ncps3lPvcrbigVIp1umd_Brl0rdk5oiMuE6E
Message-ID: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

At this point imx952 has the issue with dma request not cleared you fix
in patch 3/4.

So in order to avoid this you need to swap patches 2 and 3.  And in the
newly patch 3 you will fill fsl_asrc_imx952_data with correct value
for start_before_dma.

Thus we also keep everything working for bisection.
