Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776901;
	b=2Z+nngU0ydmCgrz+v4BRVOfpQNPDpMARU1pmLx5URjAIykU5YHJcFFMPC80/NLAv19gM
	 tfOJuM0G9+750exYipRBHk+hD5rDmWhoe9+yy0scUSmVwrLB6LVQt3rU14hj3Lb8j7o+1
	 qQBM+x2/WtAKRoK3Q78ZQIHVv2X4HQdqgmPejOUzDWfOpxWRDbZMx2XNIko3TOqjou+VV
	 NSyyXU/KZ17w7iip7TWTwUahqocmVxfOsCr1dcpRCXpGJCnSPiBTCsncwgkAgV9gMfRXo
	 qEAWtfLK1+hnlkyV9dIYqReyl084WJvn8uLduT+Kq7aota1mRC1X9DTlV+VvHUrrYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zzB0fVVNYPMqh3MFViFL/xYrH8N91pS0DgEUPc2ngUg=;
	b=J9ics9k7THOwhtnsOgTTTV/MMu2EGhgXoZ2cBLqhbltG8t39xLchzY2spYKycMRt59aL
	 xu8EKUs+I+4v8KX6DZq5t8mNHplPzj4/jTAkQsD1qHZflIO5v9xqAAOJ1q8tk55xa2505
	 iuUUGd3qHm7btHZOy1v8Uk73hIRisRZbasHZzJe8LYud3EHUjbeSE35O3mWhLd6Z0j18M
	 rJgfR8QSWWQftcgoMz7R+ywuekSYtFMzRiIcqm7yROJr4eAFpI+TjMqyvUKab4Mfy/9Qm
	 jFG+OVmI50VXKIIjtldsiztT8Fj9TAR3nhRKvw+WKc4IWZ9mDp31qsIqXBDJXCvJDyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQA+uiiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A21606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQA+uiiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F361F01825;
	Fri, 23 Oct 2026 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776900;
	bh=zzB0fVVNYPMqh3MFViFL/xYrH8N91pS0DgEUPc2ngUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQA+uiivapSfbNJfr9PnpSvQJX3983OblkaiIxKYx8vym8stijirKIUJarDu82iOC
	 L7AUe7nc45rwfiIP3Wovt0+AW1g3uk5TxWeubD/3cXf4VbTTIrqvVliv34E28DBCkR
	 fEssvC79gAtvr7t4tStmea2Mn7lNcfdVs3B52RPiv9PnpXPoMho74MCgePKXtQb4N1
	 vsZMTwk4ArzhMjFXyI+gBdWyALfzGcZGwRbvVeWMNYGQIK2GM0gYLkgoIaTW9aX4aA
	 OgOcX0Ge5oR0g2XJev106rK4erX5tt6DP+x/1KDwKMZ624A3IyX3b4GEPXypr4+oVF
	 4fKi1xo5wHjBQ==
Message-ID: <sashiko-outbox-183004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] ASoC: qcom: audioreach: fix module cfg blob size
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261023171316.819857-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171316.819857-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 17:34:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: qcom: audioreach: module leak and UAF on priv data error
- [High] ASoC: qcom: audioreach: OOB read from array_size truncation to nwo=
rds
- [High] ASoC: qcom: audioreach: unchecked mod_array header and size in loop
--

commit 1de183e156fe039ccb5c136361b5dc13fa6c2cdc
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: qcom: audioreach: fix module cfg blob size handling

This commit converts mod_array->size from a byte count to a word count when
allocating and copying module private configuration data in
audioreach_get_module_priv_data(). It also adds bounds and zero-size checks
for the blob and checks for an error pointer before storing it in mod->data.

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index faafbc5c0ad00..612d8f03e6e98 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -312,22 +312,37 @@ audioreach_get_module_priv_data(const struct snd_so=
c_tplg_private *private)
> =20
>  	for (sz =3D 0; sz < le32_to_cpu(private->size); ) {
>  		const struct snd_soc_tplg_vendor_array *mod_array;
> +		u32 array_size;
> =20
>  		mod_array =3D (struct snd_soc_tplg_vendor_array *)((u8 *)private->arra=
y + sz);
> +		array_size =3D le32_to_cpu(mod_array->size);
> +
>  		if (le32_to_cpu(mod_array->type) =3D=3D SND_SOC_AR_TPLG_MODULE_CFG_TYP=
E) {
>  			struct audioreach_module_priv_data *pdata;
> +			u32 nwords;
> +
> +			/* size is the byte count of the __le32 data[] */
> +			nwords =3D array_size / sizeof(__le32);
> +
> +			/* the blob must lie within the private data */
> +			if (sizeof(*pdata) + (u64)array_size >
> +			    le32_to_cpu(private->size) - sz)
> +				return ERR_PTR(-EINVAL);
> =20
> -			pdata =3D kzalloc_flex(*pdata, data,
> -					     le32_to_cpu(mod_array->size));
> +			pdata =3D kzalloc_flex(*pdata, data, nwords);
>  			if (!pdata)
>  				return ERR_PTR(-ENOMEM);
> =20
> -			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
> -						le32_to_cpu(mod_array->size)));
> +			memcpy(pdata, ((u8 *)private->data + sz),
> +			       struct_size(pdata, data, nwords));
>  			return pdata;
>  		}

[Severity: High]
What happens here if array_size is not a multiple of sizeof(__le32) (or is =
0)?

When array_size is not 4-byte aligned, integer division truncates nwords do=
wn,
so kzalloc_flex() allocates nwords * sizeof(__le32) bytes for pdata->data[],
which is 1 to 3 bytes smaller than array_size. However, the subsequent
memcpy() copies the struct audioreach_module_priv_data header directly from
private->data + sz, leaving the untruncated array_size in pdata->size.

When the graph is later opened, audioreach_set_module_config() in
sound/soc/qcom/qdsp6/audioreach.c uses that untruncated pdata->size for
memcpy():

	int size =3D le32_to_cpu(module->data->size);
	...
	memcpy(p, module->data->data, size);

Wouldn't that read up to 3 bytes past the end of the pdata->data[] slab
allocation? Also, because this branch returns before the !array_size check
below, a zero array_size for SND_SOC_AR_TPLG_MODULE_CFG_TYPE is not rejecte=
d.

> =20
> -		sz =3D sz + le32_to_cpu(mod_array->size);
> +		/* a zero size would never advance the walk */
> +		if (!array_size)
> +			return ERR_PTR(-EINVAL);
> +
> +		sz =3D sz + array_size;
>  	}

[Severity: High]
Can a malformed vendor array header or size still read past private->array =
or
spin in this loop?

At the start of the loop in audioreach_get_module_priv_data(), the condition
sz < le32_to_cpu(private->size) only guarantees at least 1 byte remains, so
reading mod_array->size and mod_array->type can read past the end of
private->array if fewer than 8 bytes remain.

In addition, when mod_array->type is not SND_SOC_AR_TPLG_MODULE_CFG_TYPE,
array_size is only checked for zero and is not bounded against
le32_to_cpu(private->size) - sz or sizeof(*mod_array). Because sz is a sign=
ed
int and array_size is u32, advancing sz with sz =3D sz + array_size at any
sz > 0 (for example, on the second vendor array) with array_size =3D=3D (u3=
2)-sz
passes the !array_size check and wraps sz back to 0 in 32-bit arithmetic,
causing an infinite loop or an out-of-bounds read.

> =20
>  	return NULL;
> @@ -611,6 +626,12 @@ static int audioreach_widget_load_module_common(stru=
ct snd_soc_component *compon
>  		return mod ? PTR_ERR(mod) : -ENODEV;
> =20
>  	mod->data =3D audioreach_get_module_priv_data(&tplg_w->priv);
> +	if (IS_ERR(mod->data)) {
> +		int rc =3D PTR_ERR(mod->data);
> +
> +		mod->data =3D NULL;
> +		return rc;
> +	}

[Severity: High]
Does returning rc here before setting w->dobj.private =3D mod leak mod and =
leave
a dangling mod->widget pointer?

Before audioreach_get_module_priv_data() is called in
audioreach_widget_load_module_common(), audioreach_parse_common_tokens() ->
audioreach_tplg_alloc_module() has already inserted mod into apm->modules_i=
dr,
linked mod->node into cont->modules_list, and set mod->widget =3D w:

	ret =3D idr_alloc_u32(&apm->modules_idr, mod, &module_id,
			    INT_MAX, GFP_KERNEL);
	...
	list_add_tail(&mod->node, &cont->modules_list);
	mod->container =3D cont;
	mod->widget =3D w;
	cont->num_modules++;

When audioreach_get_module_priv_data() returns an ERR_PTR(), returning rc
before assigning dobj->private =3D mod causes two issues depending on the c=
aller:

1. For widget loaders whose error is propagated by audioreach_widget_ready()
(such as audioreach_widget_load_pga()), soc_tplg_dapm_widget_create() in
sound/soc/soc-topology.c runs its error path:

ready_err:
	soc_tplg_remove_widget(snd_soc_dapm_to_component(widget->dapm),
			       &widget->dobj, SOC_TPLG_PASS_WIDGET);
	snd_soc_dapm_free_widget(widget);

Because dobj->private is still NULL, audioreach_widget_unload() returns ear=
ly:

	mod =3D dobj->private;
	if (!mod)
		return 0;

As a result, mod is leaked in apm->modules_idr and cont->modules_list (which
also prevents cont, sg, and info from being freed), and mod->widget becomes=
 a
dangling pointer to the freed snd_soc_dapm_widget. Subsequent calls to
audioreach_find_module() iterate apm->modules_idr and dereference
module->widget->name, causing a use-after-free:

	idr_for_each_entry(&apm->modules_idr, module, id) {
		if (!strcmp(name, module->widget->name))
			return module;
	}

2. For widget loaders whose return value is ignored by
audioreach_widget_ready() (such as audioreach_widget_load_buffer() and
audioreach_widget_load_enc_dec_cnv()), topology loading succeeds with mod
still linked in cont->modules_list, mod->data =3D=3D NULL, and
w->dobj.private =3D=3D NULL. If a MODULE_ID_SMECNS_V2 module is opened with
mod->data =3D=3D NULL, audioreach_set_media_format() ->
audioreach_set_module_config() dereferences module->data->size without a NU=
LL
check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023171316.8198=
57-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
