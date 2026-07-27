Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5940A928
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157187; cv=pass; b=X+bT63WmANbWWit9/13p2KXa/M11zoVoGWdAqDYK5TMoPSh+UZKCabqebIpVimorKkWn5qVOTARQr0Ozu3p9I2SCiw/BX/tuVuypnpiYK2CduY2Epk11NtWyAv2zWlUyLeJi6Xucq2BHhQqP+TIOBd33QSGtTxfqqPXmP+y66u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157187; c=relaxed/simple;
	bh=luUc9ZQFmCjynsr/029wplBmFfuONlqLQlNMir6ffmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJGhdhjnzBT4jotwlYa6iRYeP0FXFmD+YbGTBdkEzMszfzFWDpgOzp9GkROctnVWbhNGA7PIuRKcTIn8V4HRMm0MjsMMRRcq4yGb5B23mzSRsiF1tVimKc8Sn1HHnSxYR5qjkpQNcPERFiGgfM6rg0b0ulIpMkca64729tuuj+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq+uwgTQ; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq+uwgTQ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81f36179d72so31144007b3.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 05:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785157182; cv=none;
        d=google.com; s=arc-20260327;
        b=ST5CpZHZdLyjxaNE7vsNZT9mPZlF+oSov/OY5dxt/OoIJS2G0FKaOmjFNufHpktXQz
         wKfsG6zhJpNGeG2sAR/JWLqYapRDf6wh1plmw33lXPKIY1aHwSKIww/YwthyD4q1NLid
         /DdQrLZhr5eSmJk3TzKd6uXIoG4Z1V58qbohVTiI8tjWktYilk+RKm2Y6EaoiED7++pg
         wNiOT8AwaQ8xUKSUqEvBX1bw/CBHqsShOyWs9e7zhEoc/CBrz8DxK84zlBsIu7D5x5M5
         y4FbkqfooyccsJtqgdJQc+c6JD08X10EdOecKHnWhZQ9LGUSogKTyQ1KjEXtqPt8vE/H
         zRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        fh=UxdXh7UcoSraxel9+bZ55ieojcqgfGm360Ia3tO9mcE=;
        b=oP3WjBalKB3fuAi6CheJj6MaTeONzfxPVPe440uH8Rc0CEt302nzSSvDbkzIWzLXoI
         9a3SIytItQFV3GZ+rXsaQ/crJOjO1wr1DkZs4+ZD+EXy5mmjDoPEk8MIfI8eP3LX7SMd
         MHmzX3fzjm+YY4h2r+m7JOlz/tEgTey9oFXPk6/z5m9IWBZW0UPKSVk84BmyAEFtzIDA
         /ZGkLCJhL1qN0RBTSrnVAQFAmeE6x61h1YAp/M9LgqgjkJy27CuT7Aq+xPNFOIcAHgYD
         LrYS6J8s3BwCyzy20HUl/MVEL2FxrkL56oDZhRCeRkDjO6zYXa2UFVl5GvbcioSpgZxv
         ZJUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785157182; x=1785761982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        b=Jq+uwgTQ0O1mmHxnBGxWcL+kdE/a9RtHdIP1tjT7Ei9n+xl4gDgXDSpklqMXUWUDZJ
         ac+GrumYYzSuNYK88A3/T4fkN6MG4wQqkhyc+crip1OV9Ijk+VP1IqgTH+CDfXD7MNfK
         izYR0QrNtnZH5422kCYtXpZUgaLbeTRubkLzot33FEHtm/0zOCL+zY/SYXVb/YZMHfi9
         1UT3syyMpKMiD5iEheioIjGtc40Mtnrnje0QPSkcU+JF6Fi7cbHX042hz4Kxs0mUOVq5
         ese1af/Z/IOALMSRWCj+UGhUzDc90HKs6jlW61M0+1P4+BJjqXHXw0K6Q6tEdTQomu6E
         hxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157182; x=1785761982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        b=nXwdmhFY25K0NR7aujzdUboEchBLDM604dvxhzqbZrUjB9ayfo7GZYZ5Ex0G++4RGv
         PXWzr5LK4HZ2s6kpJY03FpnWKvAfhuUNBTyODwaWQg+6qp82dBlLxaqcjVHPQGvmSfra
         GoWsgRPaPHZNd9azRT0lGjBQDQG2rectHlF1TyXerqTYBlky3H/8fMv1LMQzS++nNadw
         xAbpmUwV0ImSrn+trEL2hmTxeGv6fVEtVtDRWdYjdDouSxxDEazy8HsvKxYsBZSrAce2
         eY6YXLzZ+QP2kyPaV28jL4WAvaRCYRFz03a4ES8RalC0GRUK71UJC3oPDjFDmCMFgG8J
         hcDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm72M4EAF4/BA+vJkvdsFZjFIwzOPNRzVrzx8lVd1b3iBp7tXUJe4smctqbvcuc4Ds17N4MDkW7swKCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gzHgPoZHCRtSQo7V59fCCsrLJ5loVA7I6UFvXSOrX9dWHoXE
	cnGyiUvOQT22WIoOB98IhimRULa1Xlc9xnhKzY53nP8HIKAQEK1Chv7vpZhk3BLFsj+ywvMmI8u
	Bd9DS2BhuVuBUViwTgscv8yXW2Wko4WU=
X-Gm-Gg: AR+sD12Ypk54bKrX5hndDjrMQErn/H6ll4LGk6wiZ3z+BNmtNoHTFf5NylCfR4Jhkeo
	Z/sADS4g0kvpLVsYcPxPxXepaPNcjLckCpumE3qJhg/6VRHxGzyhUZKfuWbBNU8hRliEtqEFf/X
	XpTon7iKxD5BaMKosUoNwnzxE6uXzRFvbjr8FJlpVjHsYI1T7V2ita3LiTn14Y1Rvn8vxlSdp17
	Il36kR0zrPTdwaxQ2n0WkgqmGnIJJtVdH4aIqFo9+wMEmebdPmmvGjsXz7UZmvMlvPPkw==
X-Received: by 2002:a05:690c:6f02:b0:81e:97e2:2210 with SMTP id
 00721157ae682-81f69ebac17mr31274727b3.69.1785157182142; Mon, 27 Jul 2026
 05:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk>
In-Reply-To: <adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 27 Jul 2026 21:59:30 +0900
X-Gm-Features: AUfX_mxOitBR08KsPWHGWKTOhvBmlqBsOevQYdsbBN1kI3uyZROYcZJFQfRk1pk
Message-ID: <CABFDxMEmB=5UZx6RZgFNZyB5sg-+e2hgx_T1QjV0JzqP+auTFQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
To: Mark Brown <broonie@kernel.org>
Cc: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Borislav Petkov <bp@alien8.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, David Airlie <airlied@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Julian Anastasov <ja@ssi.bg>, 
	Leon Romanovsky <leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthew Sakai <msakai@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>, 
	Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>, Thomas Renninger <trenn@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tony Luck <tony.luck@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	Yazen Ghannam <Yazen.Ghannam@amd.com>, cocci@inria.fr, amd-gfx@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, dm-devel@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 9:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jul 24, 2026 at 03:45:02AM +0900, Sang-Heon Jeon wrote:
>
> > All patches are independent and can be applied separately, but for
> > everyone's convenience, it would be nice if they were merged through
> > a single tree.
>
> Please don't do this, it does not make anything more convenient - it
> results in huge CC lists and makes it more difficult to work out who
> will actually apply things.  If there's no dependencies just send to
> each subsystem independently.

Thanks for letting me know. I'll keep that in mind. In v2, I will send
the cleanup patches to each subsystem independently.

Best Regards,
Sang-Heon Jeon
