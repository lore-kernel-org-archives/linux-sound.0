Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E13422E08
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161963; cv=none; b=ushFZy1cyNUVoiJzTVKEX7qGCJ0lZ9gVnPtTCko4JsMHEeEv1h/tZlD4qLXDSM4XCF9VtlVwX0+gMkbVLpNYObsjvkO9zwoSkag42MGqg1KN0gAii6fRjQ1mI3a5VaprkZbGzNj/xbW05qVMPfUt2zGgz8tuGSsaFel/jFoQlCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161963; c=relaxed/simple;
	bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RiBw2Gskqyvi7xxrjOFIBSYyhmVBCDf4WCOsH/xHOTqoVGrd9vEqG8twMgvX9ykx9oJfM+/RHajEKbKLOVPLHkAQxh5clpXn0Mmtt48xrAIyzqfUXOzDeEZQUd5lSrXahj/vwt9jBp6mczJy0OrLbqQ2R3Pwj1PxJZUVMwRiZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c435mPst; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c435mPst"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe459dso2872875ad.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161961; x=1790766761; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=c435mPstr8MA6KIc24xdSbmGxqHycKTcHccN30qjA1anB9f8Di7ZETnoWfHfz8mSHb
         dIZzzrD8UiN4Z2f/O8CyuNnEBneP4XkJLRPX0/6Rnf6e/19DlNbhNXNmoqLQzhfXJF1C
         FSiWOOLEDYmZYQJ9et+Wp3nsQmsPTfbwl1ne4ggdefW8z7jsi+kO2iXlXSLbuvJnQQnC
         2uSDgi/4/qgUpXSw2Xnez839PVLYuUiY+NP/9aqgUoidoFDe9NoC5SnRYHUOIJYa/oFF
         bc83epYx5hmbARIZMqHIyjrXq73iAdfGvOh7XLG68/2Z0cWUJ2Waz6OFc8ohNj6WoBaQ
         sGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161961; x=1790766761;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=mXP4q1Y0n2HXFvEwiDwdmggEJYbI5i58Xn5jspiYOpxud2U6DbXbDLfQajF8Ankifj
         cFH6icljA3mYwWTKJp7JkTt+nUTH6xwmNoR9RTR/rZFsGxbwfG6SWOOpS83QFUTto6Ao
         WrnPGUXznbg/cRSTTF1sQyFG2+g4CiqUyKWeDxKq22hPDpR2zF5Xu82Pz/cK2U/h32GC
         NA2CQH5CcxaSinXfQBtzJk1kY3mfQpWD29frIA08ByVY72DqzquanVEFq7EEXHQZt007
         VnSl6rd+3tsjmMACMFwKTimG12deD7eak3G1/+Ua8jXc5Dmrb7v0slh1QpPUFThHGA4u
         2Q0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8nTCgOUqa31K6btab0as8ij+q7zTBSH4yzW0BnKGG1L0UMnToaKrHPNPNoMvu48AnXoE5GpZKlGvr3w==@vger.kernel.org
X-Gm-Message-State: AFuF++kecfQgiEkrVza2L0r4ulSPt5h+DFCr3XMPuSW1gbHQqPZDki5T
	f3YoE3jBPwtJ0383ECSzHV5B9pOWbJptKFgGmZx/KX8hLIVJjLHTOufF
X-Gm-Gg: AYBFou0xjGTxFj5CNnNIpbpfhJpHUm0Q9iwQSzeaVYotLE9dMyREvMIGmoyt980kIWX
	GMpWC3HgI4f8s5T3iQH9kAOCjD+UCKCXrVwHsE0p7K6R6HJ636r59XhKXSdEbOnatj1UJdvvLNM
	TJwF+wxmDilGw/QM8v9id/zq570Ui4qPkodk6/uPFc8zIe2d7LKxLrx/xslPEx8m2Kcfok1X+cj
	51alCHc+jOvoFpGy7MIbavKtbVv0fLHXPONkX0O6ikYnW3ETiZVyh2cOFkc4eneMJYH35PnZDIi
	DqqZldD0RZtDU2wJcYEULa+KEA8LGhBENYfkzzX/7Qj53IAVGT3+If38sRMt9zC9y64EhtFwcev
	oK8wr1+ci0gxV8Uu5w8hUtGBKldGjZ7BL9ANaZeBz/THtp2JNhi805YlcmM4cUoiBUMODWMZXTI
	+40AhPbI8SWDCzM1enVTuSYfNgmpHBnmrSQfrt2XFRpAjoVhHctrgm60toTYeCu19oMf/rZ2hGb
	L6ORYe8VCMs5GlG9MVXoHHxf0AyC+Bx2UCS1HBkjvCAY8TFqDQXzvxiwBxKOu133gYqx8MlhLZn
	OO0oMdi55UWvJ7F0oBUYrW2k2dPrURL8qmR9yWD/djRK4wyLij8=
X-Received: by 2002:a17:902:d54a:b0:2dd:c053:d739 with SMTP id d9443c01a7336-2df69dacfb9mr19455635ad.32.1790161960734;
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f5886sm8814555ad.72.2026.09.23.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Date: Wed, 23 Sep 2026 21:12:29 +1000
Message-ID: <EVVfptRVTru_6AKB_uY-lw@gmail.com>
In-Reply-To: <arFa+frv9QcL4b36@opensource.cirrus.com>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk> <arFa+frv9QcL4b36@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 22 September 2026 2:27:37=E2=80=AFam Australian Eastern Standar=
d Time=20
Charles Keepax wrote:
> Are you using the wildcard mostly to skip the component prefix
> stuff? I wonder if adding an option to match without that might
> be more explicit.

We use it in two places. The first is as part of the speaker protection
system, to ensure that all the relevant kctrls have been locked by
the same owner (us). This one just matches without the component prefix.
We also use this facility to eliminate duplication across left and right
channels, matching partially on the component prefix but without "Left"
or "Right" in the string. The second use case is rather superfluous so
I am happy to get rid of that. I think at that point it would make more
sense to just construct the full kctrl name in the driver and pass that
in to the existing API in the one place this actually remains necessary.

>=20
> Thanks,
> Charles

James



