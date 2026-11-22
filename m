Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365139;
	b=Rwz7i+t+ykyC6oVRbODAwttLztcm134vG7tB9aTBThxCge7UgPQde6Re7OVWn+tifbEw
	 AUApYnyqHekrxEMP0SUT92Rq7RJpqmO5/+sS4LyV85Mi4WIFQUQ1ZaoanRasoYzDozjEj
	 CQNTTjm/fvawf2Cr7u2cJNFF/Y5/PR2T6HjA0YhVjDyYbpMA9jjuBKZx5fNa0q6ZeKTx0
	 Fk22Fzfzlx2KDvutffyivJDHHSV4TKffYjXmpYpCNckWKV90LOyULBZkt25OH6n9fgsIw
	 KjD+BnK9Cal9qwT9MrQi3EMo8AdJV0N3inipSdTjyPSx73SYLsRkPgEWyuwxMYVb7qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dt8i5RP92by2JJrI2tbSRgg0MLfhaCOkTNkOwIIyk4U=;
	b=ldoiCaU5Uuu9rxa+mYPZ936+G7cIYWva/B/QOfslWFIz+PExpRpUrq5Mf5rXBByLS/Q7
	 svBrOb1MsC82TVIbw/NuOfHI6FlF4PklZE3fGB5DKIbMm801SkZi/hrOcr+ZfOi+HBuSX
	 NvoGy6yAt4ciERfe0Gxl4FpyNVLtvBFT4LZYZCEWCXuotGEgcFDEFxYtZG3YpYOo5xTcO
	 LJrS0d81sZOBHOTYI7duXGm94/INKmQSd5Rtp8rgICFsz7b4dRpbQelmGYJ7eH8114KM4
	 GAkn6x08TSCcPg/liVUf/kHnLPFI0hWHNV+KRqK7s0svedB/eQEPfs2D2+4dwtLDSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQ8ZStns;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768B606A32A;
	Sun, 22 Nov 2026 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQ8ZStns
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D811F000D1;
	Sun, 22 Nov 2026 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365138;
	bh=dt8i5RP92by2JJrI2tbSRgg0MLfhaCOkTNkOwIIyk4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQ8ZStns47k5f/jSnkRF8/KwHyLGf9N7XJWm8S5V+kcsJt3s249JzJVREiNw+nUDJ
	 xzbrk8GPS2ZqekFExlZaW6/41sitfzozifb6tsMSyTJ4hagLPcq/6wxhG7MS1GiihZ
	 dChP5aFInWHbDfFkvr/TZmSM5RsHxLp/e1mihRAOEq3QBA4OJQnaku8kMydumivSqO
	 5X4hjrmknT0OH4nhECGvXMCGceBOj2elHq9Mu22itgNABtIQCc917STcofEak4MSsB
	 J2Y58hv+YB1cNnAJfJ77/B8VO75HAWIJPAPUZfnAnH38hisK7IdROqXrclm6uY2ZXc
	 uGXLH48PZoSdw==
Message-ID: <sashiko-outbox-228107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/24] ASoC: qcom: audioreach: add control link
 support to graphs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-10-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-10-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:32:17 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: qcom: audioreach: control link packet stride and size
  mismatch
- [Medium] ASoC: qcom: audioreach: num_elems underflow in
  audioreach_parse_cl_tokens()
- [Medium] ASoC: qcom: audioreach: leak of control links on widget load
  error path
--

commit 77f495967e00a276e886e8a3124534923666b6d1
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: qcom: audioreach: add control link support to graphs

This commit parses control link tokens from the topology into a
per-subgraph list and serializes deduplicated control links into the
APM_CMD_GRAPH_OPEN command packet.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index aa1f4e2967647..afa8e0159570e 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -109,6 +109,26 @@ struct apm_mod_conn_list_params {
> =20
>  #define APM_MOD_CONN_PSIZE(p, n) ALIGN(struct_size(p, conn_obj, n), 8)
> =20
> +/* Control Links */
> +struct apm_control_link_obj {
> +	u32 peer1_mod_inst_id;
> +	u32 peer1_mod_port_id;
> +	u32 peer2_mod_inst_id;
> +	u32 peer2_mod_port_id;
> +	u32 num_props;
> +	struct apm_prop_data intent_data;
> +	u32 num_intents;
> +	u32 intent_id_list[MAX_INTENTS];
> +} __packed;
> +
> +struct apm_mod_control_links_params {
> +	struct apm_module_param_data param_data;
> +	u32 num_ctrl_link_cfg;
> +	struct apm_control_link_obj link_obj[];
> +} __packed;
> +
> +#define APM_MOD_CTRL_LINK_PSIZE(p, n) ALIGN(struct_size(p, link_obj, n),=
 8)

[ ... ]

> @@ -442,6 +465,47 @@ static void audioreach_populate_graph(struct q6apm *=
apm,
> =20
>  		apm_populate_sub_graph_config(sg_cfg, sg);
> =20
> +		list_for_each_entry(clink, &sg->control_link_list, node) {
> +			bool dup =3D false;
> +			int k;
> +
> +			/* Both subgraphs usually declare the link, send it once */
> +			for (k =3D 0; k < nlink; k++) {
> +				struct apm_control_link_obj *o =3D &cl_data->link_obj[k];
> +
> +				if ((o->peer1_mod_inst_id =3D=3D clink->peer1_mod_inst_id &&
> +				     o->peer2_mod_inst_id =3D=3D clink->peer2_mod_inst_id) ||
> +				    (o->peer1_mod_inst_id =3D=3D clink->peer2_mod_inst_id &&
> +				     o->peer2_mod_inst_id =3D=3D clink->peer1_mod_inst_id)) {
> +					dup =3D true;
> +					break;
> +				}
> +			}
> +			if (dup)
> +				continue;
> +
> +			clink_obj =3D &cl_data->link_obj[nlink++];
> +			clink_obj->peer1_mod_inst_id =3D clink->peer1_mod_inst_id;
> +			clink_obj->peer1_mod_port_id =3D clink->peer1_mod_port_id;
> +			clink_obj->peer2_mod_inst_id =3D clink->peer2_mod_inst_id;
> +			clink_obj->peer2_mod_port_id =3D clink->peer2_mod_port_id;
> +			clink_obj->intent_data.prop_id =3D APM_MODULE_PROP_ID_CTRL_LINK_INTEN=
T_LIST;
> +			clink_obj->num_props =3D 1;
> +			clink_obj->num_intents =3D 0;
> +
> +			/* Pack the intents that are set into a dense list */
> +			for (j =3D 0; j < MAX_INTENTS; j++) {
> +				if (clink->intent[j])
> +					clink_obj->intent_id_list[clink_obj->num_intents++] =3D
> +						clink->intent[j];
> +			}
> +
> +			/* The list length itself is part of the property payload */
> +			clink_obj->intent_data.prop_size =3D
> +				sizeof(clink_obj->num_intents) +
> +				clink_obj->num_intents * sizeof(clink_obj->intent_id_list[0]);
> +		}

[ ... ]

> @@ -477,12 +541,16 @@ static void audioreach_populate_graph(struct q6apm =
*apm,
>  			ncontainer++;
>  		}
>  	}
> +
> +	/* The dedupe above may have packed fewer links */
> +	cl_data->num_ctrl_link_cfg =3D nlink;
>  }

[Severity: High]
Does indexing cl_data->link_obj[nlink++] at a fixed stride misalign
subsequent control links when num_intents is less than MAX_INTENTS?

struct apm_control_link_obj declares intent_id_list[MAX_INTENTS] as a
fixed 4-element array, so link_obj[nlink++] always advances by 48 bytes
even though intent_data.prop_size is set to the packed intent count.
When a link uses fewer than 4 intents and more than one link is packed,
the DSP advances by prop_size and reads the unused zero entries of
intent_id_list[] as the next link's peer IDs, rejecting GRAPH_OPEN.

In addition, audioreach_alloc_graph_pkt() sets param_data->param_size
from the pre-deduplication num_control_links count and fixed MAX_INTENTS
size, and audioreach_populate_graph() updates cl_data->num_ctrl_link_cfg
to nlink without updating cl_data->param_data.param_size.

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index aa2ab2b058d0f..5dd7f2c51d5cf 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c

[ ... ]

> @@ -348,6 +394,85 @@ audioreach_get_module_priv_data(const struct snd_soc=
_tplg_private *private)
>  	return NULL;
>  }
> =20
> +static void audioreach_parse_control_link_tokens(struct q6apm *apm,
> +						 struct audioreach_control_link *link,
> +						 const struct snd_soc_tplg_vendor_array *cl_array)
> +{
> +	const struct snd_soc_tplg_vendor_value_elem *cl_elem =3D cl_array->valu=
e;
> +	int tkn_count =3D 0;
> +
> +	while (tkn_count <=3D (le32_to_cpu(cl_array->num_elems) - 1)) {

[ ... ]

> +static void audioreach_parse_cl_tokens(struct q6apm *apm, struct audiore=
ach_sub_graph *sg,
> +				       const struct snd_soc_tplg_private *private)
> +{
> +	const struct snd_soc_tplg_vendor_value_elem *cl_elem;
> +	const struct snd_soc_tplg_vendor_array *cl_array;
> +	struct audioreach_control_link *link;
> +	int link_id, tkn_count, sz;
> +	bool found =3D false;
> +
> +	for (sz =3D 0; sz < le32_to_cpu(private->size);) {
> +		cl_array =3D (struct snd_soc_tplg_vendor_array *)((u8 *)private->array=
 + sz);
> +		cl_elem =3D cl_array->value;
> +		sz =3D sz + le32_to_cpu(cl_array->size);
> +		tkn_count =3D 0;
> +
> +		/* Module config blobs are not token tuples, stop here */
> +		if (le32_to_cpu(cl_array->type) =3D=3D SND_SOC_AR_TPLG_MODULE_CFG_TYPE)
> +			break;
> +
> +		while (tkn_count <=3D (le32_to_cpu(cl_array->num_elems) - 1)) {
> +			if (le32_to_cpu(cl_elem->token) =3D=3D AR_TKN_U32_CONTROL_LINK_IID) {
> +				link_id =3D le32_to_cpu(cl_elem->value);
> +				link =3D audioreach_tplg_alloc_control_link(apm, sg, link_id, &found=
);
> +				/* Skip on error or already parsed control link data */
> +				if (!IS_ERR(link) && !found)
> +					audioreach_parse_control_link_tokens(apm, link, cl_array);
> +			}
> +			tkn_count++;
> +			cl_elem++;
> +		}
> +	}
> +}

[Severity: Medium]
Can le32_to_cpu(cl_array->num_elems) - 1 underflow when a vendor array in
the topology has num_elems =3D=3D 0?

le32_to_cpu() returns an unsigned u32, so subtracting 1 when num_elems is
0 wraps to U32_MAX, promoting tkn_count to unsigned and reading past the
end of the topology buffer in both audioreach_parse_cl_tokens() and
audioreach_parse_control_link_tokens().

Also, unlike audioreach_get_module_priv_data() right above, the outer
loop does not check for a zero cl_array->size (which would spin forever
because sz never advances), and audioreach_parse_cl_tokens() silently
ignores IS_ERR(link) from audioreach_tplg_alloc_control_link() instead of
propagating the error.

> @@ -617,6 +742,8 @@ static int audioreach_widget_load_module_common(struc=
t snd_soc_component *compon
>  	if (IS_ERR(sg))
>  		return PTR_ERR(sg);
> =20
> +	audioreach_parse_cl_tokens(apm, sg, &tplg_w->priv);
> +
>  	cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
>  	if (IS_ERR(cont))
>  		return PTR_ERR(cont);

[Severity: Medium]
Does an error return after audioreach_parse_cl_tokens() leak the newly
allocated struct audioreach_control_link and its ID in
apm->control_links_idr?

If audioreach_parse_cont_tokens(), audioreach_parse_common_tokens() or
audioreach_get_module_priv_data() fails,
audioreach_widget_load_module_common() returns before setting
w->dobj.private =3D mod.  audioreach_widget_unload() bails out immediately
when dobj->private is NULL, so if no other widget in sg triggers subgraph
teardown (or if cont was already added to sg->container_list before the
failure, keeping sg->container_list non-empty), the control links on
sg->control_link_list are never removed from apm->control_links_idr or
freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D9
