Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CC343D91
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594499; cv=none; b=rhWoKCJzl6wDZYcmgJPIl+Fii/INFct5OBZVHAzhwrWdh7zq4ReCD5pT414EpD1IvNmXUt+6tDYCDVwEQmfEMcsHKeFCyq825u4QIL9N7KfEPKU8tl+GFFiAJr9wmLHoj+nYgvTfnjd9Rs5XDe7qJg0k/wJL9JbWGy7bkonFjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594499; c=relaxed/simple;
	bh=9v7WQdaNoQtPaDpzoCJBsmkyHzAJQ1A++FUBSLTF/P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FZrzWaEAndy/IEty6aC4417SBKzuCDfGtduIlYiyuiuJRsb5JMvOf3Lhkk3Ptu/0sEX21g81ko4a/PNHrTro7UAnUSSYsBJoIgx50Jnpj+vzXTkdIfF4mZtLo9Gz5CBSenU5o2dJN94VavmnFX6fKS+SGSgIwGvnApu+T21Ks30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w09L5OCO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w09L5OCO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so3003509a12.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 05:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771594494; x=1772199294; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKTvIic+hzKri0132pc/UWBS21rv01sHE1M70q4jAFU=;
        b=w09L5OCOyvO/owUYmp+plhJ417JRNWXA4Yx3NiT7pSyO5v2aWC2Apn8/XrElwVIW0b
         qa04yPatCT3uIPpVREtqlNVlWNDqXfTt8wVlo/TQtVCjDUp29RhU9EdtOKh7u5FgudU8
         vPEs0TObbTahxOMHbShviKteiFic+m3x5lbtt68p2ftClMkdTYpJWva0gdRDPiTnjjT3
         vipNke6gpY00bw3CZtAQm4ngEm0iXrla0AWy0hCaYLgjlKyH70wPAcZW2DEHN8zl1d23
         SUzZGlotsOK1btAk6Cc2hobN4Dr/Z9joVeo6+eFpJ3awTklmTdtx4V1rvEdHzFQAoO4B
         Ssng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594494; x=1772199294;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKTvIic+hzKri0132pc/UWBS21rv01sHE1M70q4jAFU=;
        b=P1SKDG2WcF7yafhmhECEPENevlDkTJijxkiJmJ/xY51OzCi0E1n55h8fRyrPS4bJ9+
         84wyvSXjKqSkXS6YKeH1mgqWv2wbjF0OiwrI/eAgACzZFxDEKIGkj+WJqROo+4V5RRKB
         lzjCULNylxvN5s7JmHbAxy07gJQb/a7ubgoSaQYpQ/zz0oatA5MGKYUOpcEvLKFAFDvT
         sJDgb/ZDXs1BgZsd18JVNB4U7d5F0MzlAjaF4Fgw+YgbWwO2E0ZpsQWVDI5u98TIA3aA
         3XUhW12KiyeqatPaKaltJcPCyX8KSjuE9q/5EozFk8TaoNGcf8CyRb1wjKOqFFdhyeSv
         w+zg==
X-Forwarded-Encrypted: i=1; AJvYcCV987AoSu00VprgVoKVlJXs71brc+HwL62qk4sqRareXy60agF4x0Ymffx6dSpYuMarhxNjdAe+0CpccA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfL4Ilfv4rDTc96qY4tf28lIoiQmgJkOoYbmry/535JhBqLWx
	pp/XHezirntAWxvfb1oQn/gTcKs+ULOKeKAffE5PtR0P6ILi/gWQBBHQycNzTSy9JUE=
X-Gm-Gg: AZuq6aJ3+qbGNTgw2YelyoEJGK9aCT+zD3rbeY1NaQoyAOTdk463mAOYCHcjgOQrpPp
	jo8qpIG5Q3QVLqX5H9rqoXgBwPFHZs5F75HbcdNyhWJSWcaIt4fGJeJy2lJ+OmaE0xB8VltpunU
	4++fwHpo/si9GrBxWspfpT1AS6pPuwDN3zoN2waqc2ONtZUK6ftx2RkVOx0nKeOnExZRF/xIh5O
	YfSG9yFyr6XHESCagMdgyHyZw2V69JFhuxQqjTcPvJTJp237WZ2PCudxIwG5UFHojRFY1fu16zL
	3nFvLLSFXqkBmJ5LAeC/2QLkQmu2XgKkE/8o0N8bGy3IckLKoLV6p+nHnsjbrvQrMLtISRtCZCk
	CbFL6LNIF/W79adapRlvwuxIc7o3IJePQshjX5AL7Cnhd20RvLiU/8sHmU5hUOgQFLTlwsnofzo
	5zLO2sKF69Hr1RJSmqSLEOi98GXDP2XteiXsv9GVI2Vq/p/oboOOoPw4ndr+mSMFoRRGaT
X-Received: by 2002:a05:6402:1e8f:b0:65b:99b3:d517 with SMTP id 4fb4d7f45d1cf-65bc78655bamr11701073a12.13.1771594494260;
        Fri, 20 Feb 2026 05:34:54 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e3ae4sm4843041a12.21.2026.02.20.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 05:34:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 14:34:53 +0100
Message-Id: <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
Cc: <conor+dt@kernel.org>, <srini@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <alexey.klimov@linaro.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <vkoul@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
> Number of input and output ports can be dynamically read from the
> controller registers, getting this value from Device Tree is redundant
> and potentially lead to bugs.
>
> Remove the code parsing this property along with marking this as
> deprecated in device tree bindings.

Could you help suggest how to correct kodiak.dtsi?

I'm seeing these warnings on QCM6490:

[   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch wit=
h controller (1)
[   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch wi=
th controller (6)
[   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch wit=
h controller (4)

Regards
Luca

>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 141 +++++++++++++++++----------------------
>  1 file changed, 62 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f3ad53ec6e76..9e6dc43c1112 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -128,7 +128,6 @@
>  #define MAX_FREQ_NUM						1
>  #define TIMEOUT_MS						100
>  #define QCOM_SWRM_MAX_RD_LEN					0x1
> -#define QCOM_SDW_MAX_PORTS					14
>  #define DEFAULT_CLK_FREQ					9600000
>  #define SWRM_MAX_DAIS						0xF
>  #define SWR_INVALID_PARAM					0xFF
> @@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
>  	int wake_irq;
>  	int num_din_ports;
>  	int num_dout_ports;
> +	int nports;
>  	int cols_index;
>  	int rows_index;
>  	unsigned long port_mask;
> @@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
>  	u8 rcmd_id;
>  	u8 wcmd_id;
>  	/* Port numbers are 1 - 14 */
> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
> +	struct qcom_swrm_port_config *pconfig;
>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
> @@ -1153,7 +1153,6 @@ static int qcom_swrm_stream_alloc_ports(struct qcom=
_swrm_ctrl *ctrl,
>  				       struct snd_pcm_hw_params *params,
>  				       int direction)
>  {
> -	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
>  	struct sdw_stream_config sconfig;
>  	struct sdw_master_runtime *m_rt;
>  	struct sdw_slave_runtime *s_rt;
> @@ -1162,6 +1161,10 @@ static int qcom_swrm_stream_alloc_ports(struct qco=
m_swrm_ctrl *ctrl,
>  	unsigned long *port_mask;
>  	int maxport, pn, nports =3D 0, ret =3D 0;
>  	unsigned int m_port;
> +	struct sdw_port_config *pconfig __free(kfree) =3D kcalloc(ctrl->nports,
> +								sizeof(*pconfig), GFP_KERNEL);
> +	if (!pconfig)
> +		return -ENOMEM;
> =20
>  	if (direction =3D=3D SNDRV_PCM_STREAM_CAPTURE)
>  		sconfig.direction =3D SDW_DATA_DIR_TX;
> @@ -1186,8 +1189,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom=
_swrm_ctrl *ctrl,
>  			continue;
> =20
>  		port_mask =3D &ctrl->port_mask;
> -		maxport =3D ctrl->num_dout_ports + ctrl->num_din_ports;
> -
> +		maxport =3D ctrl->nports;
> =20
>  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>  			slave =3D s_rt->slave;
> @@ -1347,17 +1349,8 @@ static int qcom_swrm_register_dais(struct qcom_swr=
m_ctrl *ctrl)
>  static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>  {
>  	struct device_node *np =3D ctrl->dev->of_node;
> -	u8 off1[QCOM_SDW_MAX_PORTS];
> -	u8 off2[QCOM_SDW_MAX_PORTS];
> -	u16 si[QCOM_SDW_MAX_PORTS];
> -	u8 bp_mode[QCOM_SDW_MAX_PORTS] =3D { 0, };
> -	u8 hstart[QCOM_SDW_MAX_PORTS];
> -	u8 hstop[QCOM_SDW_MAX_PORTS];
> -	u8 word_length[QCOM_SDW_MAX_PORTS];
> -	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
> -	u8 lane_control[QCOM_SDW_MAX_PORTS];
> -	int i, ret, nports, val;
> -	bool si_16 =3D false;
> +	struct qcom_swrm_port_config *pcfg;
> +	int i, ret, val;
> =20
>  	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> =20
> @@ -1365,88 +1358,78 @@ static int qcom_swrm_get_port_config(struct qcom_=
swrm_ctrl *ctrl)
>  	ctrl->num_din_ports =3D FIELD_GET(SWRM_COMP_PARAMS_DIN_PORTS_MASK, val)=
;
> =20
>  	ret =3D of_property_read_u32(np, "qcom,din-ports", &val);
> -	if (ret)
> -		return ret;
> -
> -	if (val > ctrl->num_din_ports)
> -		return -EINVAL;
> +	if (!ret) { /* only if present */
> +		if (val !=3D ctrl->num_din_ports) {
> +			dev_err(ctrl->dev, "din-ports (%d) mismatch with controller (%d)",
> +				val, ctrl->num_din_ports);
> +		}
> =20
> -	ctrl->num_din_ports =3D val;
> +		ctrl->num_din_ports =3D val;
> +	}
> =20
>  	ret =3D of_property_read_u32(np, "qcom,dout-ports", &val);
> -	if (ret)
> -		return ret;
> +	if (!ret) { /* only if present */
> +		if (val !=3D ctrl->num_dout_ports) {
> +			dev_err(ctrl->dev, "dout-ports (%d) mismatch with controller (%d)",
> +				val, ctrl->num_dout_ports);
> +		}
> =20
> -	if (val > ctrl->num_dout_ports)
> -		return -EINVAL;
> +		ctrl->num_dout_ports =3D val;
> +	}
> =20
> -	ctrl->num_dout_ports =3D val;
> +	ctrl->nports =3D ctrl->num_dout_ports + ctrl->num_din_ports;
> =20
> -	nports =3D ctrl->num_dout_ports + ctrl->num_din_ports;
> -	if (nports > QCOM_SDW_MAX_PORTS)
> -		return -EINVAL;
> +	ctrl->pconfig =3D devm_kcalloc(ctrl->dev, ctrl->nports + 1,
> +					sizeof(*ctrl->pconfig), GFP_KERNEL);
> +	if (!ctrl->pconfig)
> +		return -ENOMEM;
> =20
> -	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
>  	set_bit(0, &ctrl->port_mask);
> +	/* Valid port numbers are from 1, so mask out port 0 explicitly */
> +	for (i =3D 0; i < ctrl->nports; i++) {
> +		pcfg =3D &ctrl->pconfig[i + 1];
> =20
> -	ret =3D of_property_read_u8_array(np, "qcom,ports-offset1",
> -					off1, nports);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D of_property_read_u8_array(np, "qcom,ports-offset2",
> -					off2, nports);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D of_property_read_u8_array(np, "qcom,ports-sinterval-low",
> -					(u8 *)si, nports);
> -	if (ret) {
> -		ret =3D of_property_read_u16_array(np, "qcom,ports-sinterval",
> -						 si, nports);
> +		ret =3D of_property_read_u8_index(np, "qcom,ports-offset1", i, &pcfg->=
off1);
>  		if (ret)
>  			return ret;
> -		si_16 =3D true;
> -	}
> =20
> -	ret =3D of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
> -					bp_mode, nports);
> -	if (ret) {
> -		if (ctrl->version <=3D SWRM_VERSION_1_3_0)
> -			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -		else
> +		ret =3D of_property_read_u8_index(np, "qcom,ports-offset2", i, &pcfg->=
off2);
> +		if (ret)
>  			return ret;
> -	}
> =20
> -	memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -	of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
> +		ret =3D of_property_read_u8_index(np, "qcom,ports-sinterval-low", i, (=
u8 *)&pcfg->si);
> +		if (ret) {
> +			ret =3D of_property_read_u16_index(np, "qcom,ports-sinterval", i, &pc=
fg->si);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D of_property_read_u8_index(np, "qcom,ports-block-pack-mode",
> +						i, &pcfg->bp_mode);
> +		if (ret) {
> +			if (ctrl->version <=3D SWRM_VERSION_1_3_0)
> +				pcfg->bp_mode =3D SWR_INVALID_PARAM;
> +			else
> +				return ret;
> +		}
> =20
> -	memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -	of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
> +		/* Optional properties */
> +		pcfg->hstart =3D SWR_INVALID_PARAM;
> +		pcfg->hstop =3D SWR_INVALID_PARAM;
> +		pcfg->word_length =3D SWR_INVALID_PARAM;
> +		pcfg->blk_group_count =3D SWR_INVALID_PARAM;
> +		pcfg->lane_control =3D SWR_INVALID_PARAM;
> =20
> -	memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -	of_property_read_u8_array(np, "qcom,ports-word-length", word_length, np=
orts);
> +		of_property_read_u8_index(np, "qcom,ports-hstart", i, &pcfg->hstart);
> =20
> -	memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -	of_property_read_u8_array(np, "qcom,ports-block-group-count", blk_group=
_count, nports);
> +		of_property_read_u8_index(np, "qcom,ports-hstop", i, &pcfg->hstop);
> =20
> -	memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> -	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, =
nports);
> +		of_property_read_u8_index(np, "qcom,ports-word-length", i, &pcfg->word=
_length);
> =20
> -	for (i =3D 0; i < nports; i++) {
> -		/* Valid port number range is from 1-14 */
> -		if (si_16)
> -			ctrl->pconfig[i + 1].si =3D si[i];
> -		else
> -			ctrl->pconfig[i + 1].si =3D ((u8 *)si)[i];
> -		ctrl->pconfig[i + 1].off1 =3D off1[i];
> -		ctrl->pconfig[i + 1].off2 =3D off2[i];
> -		ctrl->pconfig[i + 1].bp_mode =3D bp_mode[i];
> -		ctrl->pconfig[i + 1].hstart =3D hstart[i];
> -		ctrl->pconfig[i + 1].hstop =3D hstop[i];
> -		ctrl->pconfig[i + 1].word_length =3D word_length[i];
> -		ctrl->pconfig[i + 1].blk_group_count =3D blk_group_count[i];
> -		ctrl->pconfig[i + 1].lane_control =3D lane_control[i];
> +		of_property_read_u8_index(np, "qcom,ports-block-group-count",
> +					i, &pcfg->blk_group_count);
> +
> +		of_property_read_u8_index(np, "qcom,ports-lane-control", i, &pcfg->lan=
e_control);
>  	}
> =20
>  	return 0;

