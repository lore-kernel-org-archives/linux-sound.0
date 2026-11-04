Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789944;
	b=eg6bYt+5IRzv4Dbbg8N3e8aZIOEaTXuiCffEYzuuU8ohuObGm4pxqVBr4+2dX5w45ujg
	 mLYlnHv24UZCUaySnl5r3TWdBHSxEpfcMUe0tz0ptkZHubaKfVJT6nuCZIsrqmX6Y0Y8x
	 SyXw5G7dNs2tqINtu/+pIbMNySZblE528YXOgqoGY+qNdEcizg/4dEQmSlArZpjrgUFS5
	 0e/wpds4mPDd2D8NgNrluCS/qVI0WogxnLGISbxZblU9x+dfhTFkEGEUUIvf+kq+jYEcs
	 d/Jwtbi2qG34a9FaACNnstKTTHnOx5F7L131UrXPpV8cdiTMFUkG3FOMnSZmqV1GtGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
	b=j330RGI+mE7ub/C2//2NJYal/1s2XLLTJU6MtaX38BK5ZcmkFCkAaEFBaIUNecrRSuM9
	 nzGuIiWGEdUele0wg1HRZGRCOR9wdTj8spkranZ6n1ng6JINuS3Y15FOu/rYIBssPclra
	 iGrvEmG4O83ZAvOHcFRhtWS3kGsRh/ROeH/xtBTihr6Ua4jO9CFMeIsuarYZQqPI9qeE8
	 X30Iv/Kwx9+dfpuF7WZ81vh5DpVW1n0DmXbNvdJZLCHOAt8exawJo/8YzsCmrjai6BKxj
	 SINiDo4zDTqzniv+YrS6trUIJtCfjKPlbRO53xQpZhvzjq8hjP3y8tz0eSMsW3ZU+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A5606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22A5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd3310348d2so768201a12.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789943; x=1794394743; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=veHHt0ATjkA8mDlg+Nd4K6AnUtOdd8i+sPNfn9TF2mxGCLRhq6+cTPNd0w0DYO0WwO
         qb5NtaCQGXxgo1Hh4hWWZ0zRArNwHTTyVWnTVeZg1lXMvOLlU+w1r+cPsG5P1we3Cf7w
         JSVbYA6jpjub2xiHwpEOmHOLZBEdzEXtYMe88IqmohHHYfws2Ug0seUFpcBpDz0B446E
         nSlENjNPDjTpw9Gdijhn9gHm3M1+QbVjs4ra/DFYRZqH9dAYEOBfNouTO2sNlU3HBVxB
         jE18ToGHZUWXn1g5b40KCeIxrjNEIiA5oyrGMO4UlX6HLiCc134nMAWMLECdMG5hrUFI
         bGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789943; x=1794394743;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=InB4oWGfwolzYQAR/8cW9671nmBswcO2PSlBMJCc03s3kOyzEzY6INeY/f1cuu0VYL
         3ZTEGh/usDoLgqmRkF88JEzUJInh4uCmzFn276wIJB+wjIr18fpl7ngRzOAcsT9IMq4Y
         tvhuSjWMz0tIyEosX/M1pXvH3S+NRw5RWdIctfj8R96uSYyPL7On6Q9EoAvTL+m2yxHw
         PdHPVxzn3fA6wRvbSplB/Bbm5MvEoR7EHTa3QLDNNNr7OV31UwL9hQdM3IsO2qlbiJrF
         LUd6d1UPu70ffzNiaCiZFcWFZDARuoWgc4V8rR47KvxhQhd6w0o5n22mRR08cXRQFD/b
         Gj5g==
X-Forwarded-Encrypted: i=1; AKwUvBygzEjrSwq68zBInvvETymtrz6dSqSbl7KFBPkm9zwiEWqL9dOhpvx4mmj/+s4iMGAEejVBH/Kz8a63eQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sS1Dvg9jZW6xQV/wVL6nt13palq+Yiv+t4ixw/ouxEmoXT9ye
	REIKZELGBET5WbOe4nxWYD0zQY4/cTiBGY37FstiKFGmaUqjEQ0KaqHx
X-Gm-Gg: AYBFou1BL/hEXb3eQtv1M5v+H/mWnU+bayVs0XVr99xHkPMFUCBh/YEn5cAI0cluTPv
	STj/K78Q2Ij/ptqP0wAXAoQGc+sea4rxpPPqa2GVvXYCDqTBYp77VwOn9bW9ZrnvfFHCe5vaOej
	txBPFjMoZkOru8HwNzDHrzXoGgcmNUzpv0Zn3XsMcclEhftNsvYbZBwIIJOwSSSsZAdAYYCIJkO
	NnxsLvcPhU3RjQLLwK2Y2ZFgCIOEoUn93qlkpWBL27CBLZOkUB2G3BqqXPklCwB2bAdzB7jNE2E
	cxiHyG5uUfu7Kyryc0OlyG/P6Ukoserkh2XOuGWV7T3FH+AinYpJGijFsFBXJB2HN02PzZr0UYN
	Ll5RL5PRiGNyjMBq3yCKcZiGr4AurlbBof9zkb6Gb92Ni+rioR06vICJIdw6WtO1cgDRpDq9ZDt
	01wQp14Yz8/8dfck6xAy4WMl2AD0Wv2SgxN4o67vqbJvjYWIeqvH3oFQY0JXn50VF7Af3ojwr0d
	wDD3ioBvpypAggS11ueWKbRJNh5GXG3Kn1cd+BC06Nd/WX2SozDYIjdFLtGKhofuz+8KRP0GnfL
	KpfTLyT65zRKgHEGggvuWXSBDfecIt7lvR70Otcd0Fcg1LijHqiFvOYLAuIZl1T8efRFKswtmJR
	zzTWDm3T68mEWxpXIm4QsCRQ4vls22RYK/FTMiEnJJrlKegjA/LPqe1avbQ3U3oWZ3gtoMunBOj
	98zl3e
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9431934a91.0.1793789942970;
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm3304868a91.15.2026.11.04.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:58:53 +1000
Message-ID: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
In-Reply-To: <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:52:38=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> >> We may need to define both #sound-dai-cells and sound-name-prefix on s=
ome
> >> machines where this codec is part of a simple DAI. Allow this by
> >> refrencing
> >> dai-common.yaml and allowing its properties to be used.
> >>=20
> >> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> >> ---
> >>=20
> >>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.ya=
ml
> >> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
> >> ab4c7d22dc0e..4ac0af34c464 100644
> >> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
> >>=20
> >>  maintainers:
> >>    - patches@opensource.cirrus.com
> >>=20
> >> +allOf:
> >> +  - $ref: dai-common.yaml#
> >> +
> >>=20
> >>  description:
> >>    The CS42L42 is a low-power audio codec designed for portable
> >>    applications.
> >>    It provides a high-dynamic range, stereo DAC for audio playback and=
 a
> >>    mono
> >>=20
> >> @@ -193,7 +196,7 @@ required:
> >>    - VL-supply
> >>    - VA-supply
> >=20
> > Missing dai-cells constraint
>=20
> Heh, I already asked for this two weeks ago.
>=20
> I do not see how you responded to my comment, dropping everything from
> DT patchwork.
>=20
> Best regards,
> Krzysztof

Given that the binding did not have a constraint for this originally, it
was my impression that adding one would best go in another patch unrelated
to this series. If you think it's fine to add here then I can simply fix th=
is
for v5.


