Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B76386C32
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 05:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897452; cv=none; b=RMEIhAm8oTJa6xmckYw1RhlxGP//ZjtVrf3Co3i76CC8YlxJE46OSzGgjta0/9NfgfC/dIbX0qV0LN4dD7SfcsGDTS3UZVq7ajdvdZF8wpk6XaS497mvEOQAiVDGlHD1Haj64Q2NiTxC9oN1XMV4QYOdQA6ff8Q2mEacumC/+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897452; c=relaxed/simple;
	bh=8iSqG3x2o6WvyVuCa0n3oqyrmMUTpcn9qdWP474vCcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lM6zj2+Mrb9qYZjEwK97iI8ZREKxhc1+5LKbEq+zbgx9kKFLrTHwgXDi5hBDbDPfBjgwCVzWyYbHwmicUFG3tMP3q1Z4IwQ8ycuocu0dPKJroCyQtsMqtbYSN6ej0IXLyT34XvRIqWwOPsIMgOZek64/y8NvFgyu4ghL8PTuPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TL3mCY30; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TL3mCY30"
Message-ID: <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773897437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGU76WHTiNP96NxusRYJzGZVbv7nm2kMIO9LDJdid6Y=;
	b=TL3mCY30jsexb8LxKKS7BdXmuiUi4JKVRpIa0JB8v5UeeQXy9lBUKHWpQbDLkm+PKFQ/eX
	vfF1U3wVd66GmG8Ixi0YfgUCMjZDPw/KTCLtgEyJsYKdb2F4DqUnutyx9vQey0M1R/dcwf
	tl8iPIUedkPMl7jmjxjmBKghUH3hEFVPQOPwgZTMK/uW9eQWs18RyEWntcCrywduP+6uDv
	wxKQV3enFkFltIWhky+hV5JOa2KavHIZJJQAkNqeTo8t63Od07LfsyvDion6eItJSQkqqd
	u5Sm6WrB+i4AxD0XCcqVD6LpgRzJp7VHRFbXDGXeFiiktioWwKoofSsLsWJqsQ==
Date: Thu, 19 Mar 2026 02:17:03 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mailingradian@gmail.com
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 3/9/26 3:51 AM, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Introduces support for the Senary MI2S audio interface in the Qualcomm
> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
> necessary mappings in the port configuration  to allow audio routing
> over the Senary MI2S interface.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
>   sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
>   3 files changed, 41 insertions(+)
> [..]
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 43d877322bae..7bd40e32f758 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> [..]


One chunk is missing for this file, adding it to the big switch in 
q6afe_port_get_from_id:

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 7bd40e32f7..40237267fd 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1783,6 +1783,8 @@
      case AFE_PORT_ID_QUATERNARY_MI2S_TX:
      case AFE_PORT_ID_QUINARY_MI2S_RX:
      case AFE_PORT_ID_QUINARY_MI2S_TX:
+    case AFE_PORT_ID_SENARY_MI2S_RX:
+    case AFE_PORT_ID_SENARY_MI2S_TX:
          cfg_type = AFE_PARAM_ID_I2S_CONFIG;
          break;
      case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:


With that + adding senary to q6routing and to SoC specific sndcard,

Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

(WIP device, patches coming Soon™)


Thanks,
~val

