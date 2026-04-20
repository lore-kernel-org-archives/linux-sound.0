Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D882A3BADB8
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776711324; cv=pass; b=Q96AWP0MHTBF9o5djt0zqXFZQe38QnS9TZz4tcQJDRH3Kwl0kdnS8JnXFSLaQBuiqIMktEED00K1KbRqwTetj1LyH6Kppb719D7yoCNuVIHLegbE6IXGH4HA8dDjpy1PrH3SngertxTSlKMPsHmTrknj8IWEyC3ybtSQXASxxLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776711324; c=relaxed/simple;
	bh=/TbSc4wIaTNekDpWJoEia/VNp42iN/javNkAebojTos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb7FsOamH1gRUw48EUlGJh8lfSKCRrHeKa1egKUbqZuvlqo6Cv4yxqjx2AtrfYKZyL+rnJNR0fArsloAM5C5qmmQ9wTinJVfeh9GLSkhVTSieevQgSoXBXb6E7a85LoMLmSnS10dk959Qv4cXoKxDrr9AKZulny9uW4ba5W7sWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4yB+TSj; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4yB+TSj"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1279eced0b9so4894731c88.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 11:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776711322; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqmrfPBRNmZOHy4uHUh9bTGjtgsi/WdYyVI+HfBigBkivZ+LN2C7Knzegymae6C6jW
         SrrWw/nclaibzvF6cMi5eL2Ul59L1a69N6OcSQ2Uf3+17FRrpYpzL8+DRV1l31ZcBBq+
         bl0wSN6CYBYl2OYi4238WxVB592IIyLfHrKe37+bDjsOPnTxlPi0cJopG45mUsK96fVo
         X19t8KJcgtF78lYzAq+PYyKEZqkY95H8j7NQPKtTmLVQFYrMx99QKjk+1gBZjpphVNgr
         tWVrioarM4rqAP+dy3KR40BEP4U0tAxO918KlwidPaE2aEqegyy9/s9Vpqhb1N+rl1U1
         Stcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        fh=zI/blfPRiBZYQW4RWBmV/VZTYWYLu1FXCc/t/pAfDII=;
        b=H293bqFjcLRZywpt62SDiijx/bJNaJcz8IEaFpVAHLFlZyK7DcedBCROU/aRe/se75
         HgY/963LeqHkP7/iNoaT80Jg+Q7ECvULaVDKMfoOTmcEj/O7tKq/kLe8bQLIpKEarM0u
         hGjKTOL6IyYPTUHQYTL4IcYH1vhV9M2Y5N3Wi9b/pkCR4olPmaqnpvX03IJGGjJXvEA+
         ias/ch7IzQHoUZWuaFZCgnfVbbsgK2LXSXbNPpErg90d93Sy9g6Koz9bqI/f5rFNLE/i
         TXtLVBIYV8YK/ujuUaseTaIlvMCH8x5PreL7693cMDh3zpe8Hqhy3RjaT1jO+N8K4JVF
         L5sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776711322; x=1777316122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        b=g4yB+TSjtwdRwPpcfeNgQgyTdK4STAjX+4YdLz7AwmFnpgetH8fRxqXbPd0NGwcspO
         sPSH0XMS4hGxGV5Hvkje5+VHGBgLg9FqL0v0flkq3bgf6HwYg1f1Z8cp+1okvOWpUvZI
         IKuLHxQs9L9NRMf59NOSy97vKk0ZFdvcAfJVJH7IKkB6NHr4HpdHr8VQTWRHRnax3nLc
         73g9eKAT1FxEpYTjRlRt+KwgtGJX509iWYWPiOJIgXikS4z8rSXEG80Tn67U6KGr4Etg
         3c8a9Vd3dqeN7rquzW1IVTP913vEspPzoHwlBLabBfR08BbNk8q/pCFFse0jh677zSPr
         kjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776711322; x=1777316122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        b=FsDuPOEj3PBMUuCQ1MAGGkF6BEIottyQOfwMaLkEYpkVuPcDLJg6Ldlk4atJX1dGPy
         LiT6M1G1dCoeYP+ZI/haXMnuA+HqMH1IQ+1lqgEioGpM+6juIG8PFPWpw3an+Q+i4Dxh
         V8eJ6+Pf3tyKhpOQNfk3ZLk9Qxw+O5gGFK3AYoieDL5uSUtsLQBIB/9YZYziphxXWKSZ
         m9D+RHa5Iw0HAF0AIrIFBJsSO77VERNmrYKC4gSv7K+7VPnh91Fam+m2q3pIlbnmfTno
         xsDeO78QX9axr2c3adm33q/J4Tx7Ey5x3EsXxtWXCoCPUjMvAsACkOix2qrBmnYl8NcE
         oevg==
X-Forwarded-Encrypted: i=1; AFNElJ8swwwq8u6RQf9VMkwJGGK9IrnbRhQaniVFpLCb/LcxldXvZfEpcXUm90j4MhqCKIjMlFYeQ78X6p2ZSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdvfcKLNLx6uulbmFhrNxBa8Bfx8ZxUw7utX5zv3DIUu8JLCM
	izYRjm6Yq0LvWEspwKbUg37OlHJStTsiunlXOheEqJU8owW+CwdjvytOhqCYaxHv66JgGfHQE12
	6vzJHTaOmlF9e2jvIugMI8KYEf2q6igE=
X-Gm-Gg: AeBDievjjdPcRPrtRtXE/c6UpmaN4xSrfhTjAlOf6cEcUW5GoItNIymYoGi97ZvOlC4
	NzX/TuQSlhZOn5yGtinN/rylQxftGS5WzLkMbxv7L43XGksOhTyVIa099o3rIj8/TAPJ/Pzp0uW
	nTkd0LjQAxOdGWI1GnC29b0PhZKm9wT6JsYr/cEHqniHe0zG6X+xH2BP57r0X+aeRvYN2rcz49T
	gumJtDTf2/zOXHXAdUDhnFyJdr4/LcAj2b8/jsTHt81nF5X7IZ5iTcNlCYYaGvBYDz/Pfsx1xh0
	OaV+fH7SpUPpFyuo
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id
 a92af1059eb24-12c73f6d69dmr7548688c88.3.1776711321897; Mon, 20 Apr 2026
 11:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAmW3WY3bhUXvUZcPpwkD5NhzGRSv7b+tUKbNZcROvkqQbyTMw@mail.gmail.com>
In-Reply-To: <CAAmW3WY3bhUXvUZcPpwkD5NhzGRSv7b+tUKbNZcROvkqQbyTMw@mail.gmail.com>
From: IRRatium <majnkraftiigry7@gmail.com>
Date: Mon, 20 Apr 2026 21:55:10 +0300
X-Gm-Features: AQROBzCzIaFYoierQgC1E5PGXrG15FutaN7xBA9MGwBT0tTAiodRFuX-9czHqAw
Message-ID: <CAAmW3WZvTB3Xr0CwVWBMJ1_dR7XOizyuc=XDvK8dw-bvEsVYYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
---
 Documentation/devicetree/bindings/sound/cs35l35.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cs35l35.txt
b/Documentation/devicetree/bindings/sound/cs35l35.txt
index e84f30c5c..1d364b3d3 100644
--- a/Documentation/devicetree/bindings/sound/cs35l35.txt
+++ b/Documentation/devicetree/bindings/sound/cs35l35.txt
@@ -82,7 +82,7 @@ Optional H/G Algorithm sub-node:
 Optional properties for the "cirrus,classh-internal-algo" Sub-node

   Section 7.29 Class H Control
-  - cirrus,classh-bst-overide : Boolean
+  - cirrus,classh-bst-override : Boolean
   - cirrus,classh-bst-max-limit
   - cirrus,classh-mem-depth

@@ -155,7 +155,7 @@ cs35l35: cs35l35@20 {
     cirrus,shared-boost;

     cirrus,classh-internal-algo {
-        cirrus,classh-bst-overide;
+        cirrus,classh-bst-override;
         cirrus,classh-bst-max-limit =3D <0x01>;
         cirrus,classh-mem-depth =3D <0x01>;
         cirrus,classh-release-rate =3D <0x08>;
--=20
2.53.0


=D0=BF=D0=BD, 20 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:53, IRR=
atium <majnkraftiigry7@gmail.com>:
>
> Fix typo in property name 'cirrus,classh-bst-overide',
> should be 'cirrus,classh-bst-override'.
>
> Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
> ---
>  sound/soc/codecs/cs35l35.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
> index 7a01b1d9f..7d9b42c5a 100644
> --- a/sound/soc/codecs/cs35l35.c
> +++ b/sound/soc/codecs/cs35l35.c
> @@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct i2c_client=
 *i2c_client,
>
>   if (classh_config->classh_algo_enable) {
>   classh_config->classh_bst_override =3D
> - of_property_read_bool(np, "cirrus,classh-bst-overide");
> + of_property_read_bool(np, "cirrus,classh-bst-override");
>
>   ret =3D of_property_read_u32(classh,
>   "cirrus,classh-bst-max-limit",
> --
> 2.53.0
