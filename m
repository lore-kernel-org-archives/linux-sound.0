Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F913839B9
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284419; cv=pass; b=CC+74VmmGf/RwYLWQhpvMYEea37+h9lZesAzOexmjHy6PrNL/tz6fkzXEsJuddemTi+T7YxvZufjcW9WI4E3rcP4tvJy7t+GOPNmrWt9rluo8Y0mcu+Jrncwm/UoirSoJIC4dVA36uXJi3Hpvccbw43X51GAUIOmKzZUkMmWCG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284419; c=relaxed/simple;
	bh=oPnXewy+StHDGXwtmPu4kj4a3Pu/agCuE4dOn+nwcWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTNMUadpVr6CK1pxIYKKjKuOGtwfqQ8A3vP/NmWqqNNrp43+SGYYkYbEAWpNxAcmSmXI79iiA1rtQFOlQ9NswOY+HKLX5/dsc0qHigQLW8hr6u14oHQnS2I8qYergvKDz6dJ5dbMYbIXYqMSN8vMM7Mef8yQxf682+jqLYHeXR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hR6Pnlln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpD5rwx0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hR6Pnlln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpD5rwx0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u79Z2262240
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=; b=hR6Pnlln/3aTUja8
	to+PzjGWDGeLr0WRnKM0mB7YnxlMZ8PKIsUTckEloS6v1OaVBdYXSOHnd7R9dulg
	VSYAeqic7CkFAJB8tu/RVbJHXUaaUggiM2GcrGo5IOBaWXutVwRxpCI0lgekX93e
	QJU2PpQxpCCTTx0MA6gDKOKs846DK5J/gERgNKHkWUUD2CkeYQZkLuazqFdI2XPY
	z59olEJZvC4liV1eB1O36sGwJ3E4T+vM2uiyoCgTYWoAnGuic1m8i4fjpzHXoUJE
	RAIOn2ruzi+YVuiMxjh/TvTAOHM9rJzM1aExKfZGqasgB1JlDwxUpviTBvTD1dB+
	wdDTwQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yv7jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:00:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7dbb5e586c1so18216047b3.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 00:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284410; cv=none;
        d=google.com; s=arc-20240605;
        b=FF3xcCRV8lGgr6Z3gFb04lcGPPtfSXE67eXIhzXNx8QeaEmN0oQYJhW9F4eUlgNy91
         Ju9LuMfMCBU/dnu1bxExFwWZYvNnFFWoPsAt+SsY3EMQ48X+q+hBkrWTOFiZzgHeYiZ0
         wJpu3TE+dRqWiLBJzH71ymI77a6cfcXGXFDyDtUnm1I3rfwoAjUu7ejBUg75NXldffar
         EdrvQFeVmtKZbsGfst92tqM8Fwty/Uv8lLG0Nh0tudlIq6ZTlPoDRbLVnVMmN0hJrpmI
         JFrVuwZtmt5Ty42iD4ClRArkz7LMBYhJ468QkbSVni6D6l3Yqy0AriFNJfFUALIVp89K
         z1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        fh=ceVnIZt6fE7qx+Z8eLcd7XxiGeeTuqARYQaoJZizo+c=;
        b=iGmc/NHyMGNDW+ZACcpltv2NmM8q970AKOCYl0cozTCI9f67jQdtToyMdv+RSYgsy4
         CKS9ZtFLx76sfS+4gvgqpBZkcW7DgnLXmsZg1mXpZggVjB5ZcT1FOdnCpcudFBpwK97j
         2DqnFgrQ9mtnNJg5ynivZ7W2erQMdbfP6rJHJ69uX7ilg7TK26+1bEN01+S2a+eb6uvz
         zI2PbjuiSqFy8hzJnEHKzKqyDvgAJFbXtgLEH7ENcP6+u6G/CiwOPBt4d8NHVvd4nKzX
         AKadMoEqYlfpk2FYUjUDoC6Pn2hrTdpA2eFQM7eLZe5nBZNdG2eXkb6b5ZKpjoyM0YDE
         Lqcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284410; x=1782889210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        b=VpD5rwx0Qws68vuaT+0qsdJhRyrjtBYdiadrI0enkcVftwr1tX65AsuxU21tCN7iHg
         Jmp1ky0xRBBkF1aTgXBju4OIN1GrGOqTfF5htg0eBe5uEXnkcj98bkeLXUlKuwwO6pU6
         GI/Aa9qvVP4/QXOsEAducRJqb9DhlFzIuI5wpVvuqNsW9hNr4gXcYW4jjuS7miqrrwaq
         D5Mk7+3aIec9KpwrgZpwAgmrnVk+zNdTjVj74Ntl5WcAM9Er7RCFt9dZHmD10XbFNgcA
         dcHv2PumMPl01MmZ83/lvIdAE7fvzwHf21g2jQ9m+5UBg4CrG7+DfxrymHQ+3jb3O5nH
         4IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284410; x=1782889210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        b=h6r2e5kbFN7Rkj+CtpVwMk1DgP0jdmkv0QH1yc0aLdJ5+4gWiizWctcRayuu+XWKxD
         jS58xKAosMZPTUkyBcHk+ZeIMTdVq1kE3jMNGJEAX+auqyVv6SYtqL5fOQzsaMKWEh7I
         pOCumk53X7D0kgJ4s7pZ1ZWgWbxuGvR2y402uWVbFNF7RWW4tJBzGlIFPfwdmWyC/64K
         gpRR64PjtctedwW1dCRqKJr2Sa2NzcttOJFDYVU9bv/j8tFvCoe/3jsH2JE6PQGjSAEI
         PNVKWa/Kg/eof0A5K5vQBn4J+tSkNi1HSRvobidi8tvEHUzFaDJYNFfUjIQJMqRZFqJD
         orUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7tSvbeSjZIeRjVXTuCiKl4/rxAAPe2Sj4myxGKePhxjUG9qOTgAFyWiu+XW+xnI71gf1R3bQL5EX4Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqJlS6Ht9PZovTB7IR9B8r8ZiUbNMruHb0sR1gvOWcxj/zncC
	WxxMQAy7nj5Y2SfLAyspsYPBHkeYUqsL3pVaObOUG3FooXGM3F6iihLeOtWKmSsWmN/oaicdxzg
	5BSbwid7n7QWnUKHwTmR59XC0c7ooY5NrE7WG7EbxjpuMNeZAe5JCyWu7H7T+HLEZmXEPSU+sqC
	S6El0y5LOd+mZZszuoHCfPJ+Lro/5eoRUVff0z8awH
X-Gm-Gg: AfdE7clOwGMpw821oCBubJzktPxlRNtoEtg5x3kwJ1e9PSVhGPC5dFkm7gLrizwud0Y
	YXq0cSvNzhv4yZkB8u5NZjIw3GVS6iQvhIMjZS869kVtvETYVRyE0VzHEgYmdNbp3BDAYz2gGBw
	k9VK7GLTSFHAvk2jn1bGrRUBhtkVqVFUfO/9cVSHlJTTdhIXqbDsorWbFkkfptiqD0gOjM
X-Received: by 2002:a05:690c:c455:b0:7ff:83b:72ac with SMTP id 00721157ae682-807f27fbd82mr20880157b3.12.1782284410339;
        Wed, 24 Jun 2026 00:00:10 -0700 (PDT)
X-Received: by 2002:a05:690c:c455:b0:7ff:83b:72ac with SMTP id
 00721157ae682-807f27fbd82mr20879917b3.12.1782284409886; Wed, 24 Jun 2026
 00:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com> <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
In-Reply-To: <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 12:29:56 +0530
X-Gm-Features: AVVi8CcSQz5bnv0X064mFitr8CQPXMcyB5PfpB6F6jJw0iQ1yBkRbyOZPxsG1VY
Message-ID: <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3b807a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=70Ip3T5yH-gdihXWpJwA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: XX9jRX4vRleoiLRud4Vlpcc7zQeJgGWb
X-Proofpoint-ORIG-GUID: XX9jRX4vRleoiLRud4Vlpcc7zQeJgGWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX5rlOkb10ZLS7
 pCV8AQsjVbCorOIVoSxsVYeWJL16Rm30KVHgrEZ507ub4WiQ/AGx1KyjtcpgSm1eQmZL625ZfaF
 Ki/VS5Ue1BiDn63Bcp0hXdggmXauhfTSqclqJo2NUCePzucEs9K22rM4DsEfPB8j3gUfS9EHHOA
 NsaWnMzhX48WQg/rl17iFcV/tPr4rew5wfY0nxrwU3iX5cMQvip6jmViewUG6mQ13zXBMndBJCZ
 fnxKudZJs/RAO70ef8P7WUeEoqHQGA8VLgp0v9Zd1R73z+44eKqQXcLZornwgiL7uVBmscWVb3+
 YunXmGGeTSSl/jooXOKOVvF4/LNkk97zF9lOw4edHdnJLx8ZoACdB4TDEKTpmet67WbxRKODRM7
 ungS4Xy3kFH6Ud2zSpIkPBqwk25IoFjtpaoKT3G61ifx26RMRhFoBogZF4awjjQC28C8faz6OC1
 YgwcRsrNGCaLEvLR0HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX3zA7ZhqNR2wq
 p63WWJIYCVR4Ttcjnl5lSqoWtKtMaJE1Ld9Y235P6mBy4f2sQ3ZamUn9XNaJ3qxRBB9KqUtB3HQ
 5TZZsAVYpGZoYYEgNJydCw+UASNlcy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240056

On Tue, Jun 23, 2026 at 9:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/23/26 2:26 PM, Harendra Gautam wrote:
> > On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/5/26 12:37 PM, Harendra Gautam wrote:
> >>> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> >>> controller used on the Shikra audio platform.
> >>>
> >>> QAIF moves PCM data between system memory and external serial audio
> >>> interfaces through the AIF path, and between memory and the internal =
Bolero
> >>> digital codec through the CIF path. The controller needs a binding so
> >>> platform Devicetree files can describe its MMIO region, DMA IOMMU str=
eam,
> >>> clocks, interrupt, DAI cells and per-interface AIF configuration.
> >>>
> >>> Describe the single register region, one EE interrupt, the required G=
CC
> >>> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interfac=
e@N'
> >>> child nodes used for static PCM, TDM or MI2S configuration.
> >>>
> >>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: lpass_config_clk
> >>> +      - const: lpass_core_axim_clk
> >>> +      - const: aud_dma_clk
> >>> +      - const: aud_dma_mem_clk
> >>> +      - const: bus_clk
> >>> +      - const: aif_if0_ebit_clk
> >>> +      - const: aif_if0_ibit_clk
> >>> +      - const: aif_if1_ebit_clk
> >>> +      - const: aif_if1_ibit_clk
> >>> +      - const: aif_if2_ebit_clk
> >>> +      - const: aif_if2_ibit_clk
> >>> +      - const: aif_if3_ebit_clk
> >>> +      - const: aif_if3_ibit_clk
> >>> +      - const: ext_mclka_clk
> >>> +      - const: ext_mclkb_clk
> >>
> >> Drop the _clk suffix, we already know they are clocks, as they are
> >> listed under the clocks property
> > Okay, will correct.
> >>
> >> [...]
> >>
> >>> +      qcom,qaif-aif-sync-mode:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        description:
> >>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pul=
se)
> >>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> >>> +      qcom,qaif-aif-sync-src:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        description:
> >>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mod=
e
> >>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> >>
> >> Should these be boolean flags then?
> > It should not be, the intention is to define explicitly, for better
> > readability I can rename these flags as EXTERNAL/INTERNAL, Please
> > suggest.
>
> Are all 4 combinations of them being present/absent valid on shikra?
>
> Konrad
Sorry if I did not put details properly, I will be correcting in the
next patch. sync-src can be external clock or internal clock, where 0
means external and 1 means internal.
-Harendra
