Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E8E3F7869
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274022; cv=pass; b=r9WX8x7uFjxt9cZW7TbcoNmziHAcyEGt0PlS0utb1ZbZRQg1NXflYbt5ktNlneuk7LG+yJoDnaQ6oZvgzINHSHQkwBOVVdX3kihQSi211Ajaj2JAOjur55bUb8DFrJDuAT1cD3eDef16v2KsVPQWYxvk0HC0p6VJF1k+HScTG1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274022; c=relaxed/simple;
	bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmzGghN8MbLAdnQu51M7KhPY5Mrajt7l6Kwnbxz7JCB/X+YsdAaHzD0ehLw9JSd74Uu8nXQ1unFGTqfxpZm4dY6HG+ZeBA9KLCZBMsBL9nBlKrJZw2fzJqJapZmDGhmZSCBZ5eKWSdDs9oA2roPNvySU2z++SgohoiSs1viDQ+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJYQ3j39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dllRBTIx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJYQ3j39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dllRBTIx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8paE2910735
	for <linux-sound@vger.kernel.org>; Tue, 1 Sep 2026 14:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT3RN5VdEwJ2zJ5PYII/r+JE
	HnQOkc7pAjMxC21FiBY=; b=LJYQ3j39rNg3jWlWWauFXljfGn0CDk4MSMJrmPlv
	L15NtYDyNfvCTM4m3op85ejvzHPlnVv5fmfGigCpij00OFLABTu4XisP7YPYy6Ij
	9/CwakbGQbgKzBmT+ZJTZRpU7Ayr2cP02DMLfqbI7aLeRqAEFwqeFkWEStD70qn/
	aReYSwd/sgFUYw5VU/9KvIm3S30u3taNTCy/FKbU9oAFRgLFhO9zEz3JGIIhqxJH
	hIUyfgxjAALr/cGeJjOAlXCVucSem4oZ3BmP1fGJMmpCSvmqGDLh4pEd3weG6Tjt
	GxBXCVJqfYmlWybdPMpp4B0VPXv4n+L4zyU38VACb+eVpg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2whr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 14:46:59 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c73057f18so6622598d50.3
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274019; cv=none;
        d=google.com; s=arc-20260327;
        b=e67dJdDoWEDqFqq/mKOmtMbwkPTBy65rUVdbv9df3jKS3BZ0ONEuyuXlr2CfuOtZ7u
         1EYrE1GM7dp4RMTVjQyslRawq8JYOEv/8c5IcEg8DxN50sZaxCQU2OdW/4ILMWdeewqZ
         vEGdwE1ieARoU76PWrD1rJ2s7n6Q1mvK60xNAjExgk8CnCidZD+Kl990wzUftSwRbyzn
         Vk8auxQxshc5d65j6eK6Jx936rZAcGp54VD8X+4U8i33ivkioC1xhOWdsOhwqkZWdKbR
         PMIE6+yzNwnZY8onVCloPyty/mMMTFnBakuyNoid+2GW64vSQWfrxkWlt8h4mzuIovjs
         GXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        fh=lEkB0ErmV5NdTeRBFRKKCqF8FDrJjbfr4n1bQ0lcxIQ=;
        b=BIwSmUY9sf21+XajnKCtk+Tt9fk66KLS3Ah8B72wjXl6i+fP9Qa3MiuRPprhRAK/9b
         azlk2GuXLgl5Niq67PXRGJG0pkw30IuA+oPTz1KLApzG1uPMGI6rLbrc6WjseZkK96gu
         P9O2M4vsy8Wk4Y36iQWNzQm0nUuYPk8jUDQYfOiNMrKyC48XyktDXyu9HCPGItrA6UfE
         lpz9lIUg+wIR4lnVvEA4UdqjPkP7Fqm1rKiIFvU99GLD11rod2IArwWfZw4wNYXul4fU
         qERxuOWusywCIC6k0dsw9zVEn72FV85F4liCAE+uKQYOR4tFWVLGD9Io03AFA9Rrz2ZG
         luoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274019; x=1788878819; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=dllRBTIx4NEgI6OsD8au0l3ld558I9KBnwJ2DFs/pHFivbInfGIark1LzbjJQHhakA
         JtB4U9dR3TnwB9K4JirOCaip0rxRR7yJ6H/qWZ323sSsgFxBnAoupVJwZxLlRhgn+HlO
         eP4BOWJJ96pexKHXzdVc5nB+FiIHZlyet0hx9TVvMusY3lC2cFCE/CI4EUN5mxxzN1sy
         0Y4/LEkT/InJDNzFVjsuxtPM42BkjKh4SZ75AT4v+nIevHo2jWfcixf0mkWBk2vR+0A0
         paLPELuGz+hOdCFJurkovB2SwgDvHzqezqWt2cRVxrKeHv5geh/8ZJ/z+MWr/qY2I8d+
         jzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274019; x=1788878819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=qsdvE4zkQ1xl6JubBtSlQMtIZbJ7RvB6JNnMqOQmmUQDtm4W3mkHdYribcbYQeceUj
         UNgU14qGl1uDoPyk8bkh6Dvui02OdV+VFp9P9JjX/KMVY51gr0USeVAx7zJS2O2v7FU3
         C9+QUkvlngbWaCi5LBvNRERXd6WaapThqJQ6lsg+UWkIoW8DqGWKk6+lI9xJo5+ZX4/G
         3udcEZ2Epc2bqZrqF2D9cJsYvfXt7XDLDABfoWADFBeAJglcrF4U0Pr+1ZOAZwrsUh/P
         43SgLukQ3MdstN12lu+zQMy89alINFy632K9/KYoTn8Dw8U1rG8vgz2lNy1tkPbE99t9
         nN5w==
X-Forwarded-Encrypted: i=1; AKwUvBxiQtrbw8Uckq4ZdeQ0FyHp0diVa39QjHrc8ldYt+W1LgDvhgcUAgmLxSeN8pKA1j+b0VZtk5/7Cj4GEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mk8/VOSh/5gO8cPG8S5zwEmLu9oQHYBiNKe7PPNQjtA3s4ckLO
	N2Jz2WCb1E9nzxnktH9h07NEEGmVQk3/00ajouJVxWFR/07z0CVeXDbUxd5rWeuBMvJRLR5I5QN
	WkhksyyanlqOTfqxywLsGD78Tzm8tRLDn3mWvOQLifA4uHmjzz0ZplEGxP6thhAgo6TnaLptJ3i
	KLw64GheLVSzVuKJfb6L0yYw3lTb8hNwoTK/k30IP1
X-Gm-Gg: AYBFou280L1UURTwvEa22CPpQ/JOwBtkwzy7Q1YcUYUU4oQe+XYYWl6jC1wwK4cMcTw
	0YhN5wwQXGMuHI+gAaRmGZSubm6FbMl5xfzJqUlZKXtG2MQNYBMkjafjfOntNcdcvMgs9MayVjl
	yN9wC5NbExoXz4zemCDzvy1c7NwbuVTGhK8h4Eo4Trtw8ewMLr+A+ru1grCWg=
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id 956f58d0204a3-66f856546f4mr2647739d50.24.1788274019361;
        Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id
 956f58d0204a3-66f856546f4mr2647716d50.24.1788274018846; Tue, 01 Sep 2026
 07:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
In-Reply-To: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 20:16:46 +0530
X-Gm-Features: AcwNN1WVNVZF23H9olknWUBf0jBjDI0S1tPmtjMycntbFFHs18PkVuP9uKwJBYw
Message-ID: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96e563 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=ubUB8SH87j9vw69hzB4A:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX/ndVIBZSoI21
 ivrss/gD5u5cvYD1MoKClk+hREcxmDCmszMCorUb9eYhYu2FwzQerpX95ro+jH9lv6XTPzrSyep
 EUEWV+0IUrXruRv1oaL/4jAq73Bfura7PnLsilLpHSTYvmTmuv5hV2/vM4EE7ZyfqioFKJmOFP1
 gHK6WZ3Q5c7L6C3cDQR975vz1XKgaILU+yr/ZVNX1fPwLBczNuWexRTH6gV1r0t0j7cMk0I8wRT
 jWNUyUMzLnDndWseniRg1sBfiM/JZsgpcxM0MR6wCdahJGqaRGJzdWisbwk6rwRsxUTJ5+C4JC2
 xYgnZ6USnZisoMmxACjiZu/l4cwbzu9GH3cb9/TT0wptNRu4G5F5IrROZxWmS1y63EYG5O8uRef
 wJJASQElOxA5l0pfcsnVD/Ln1H4jfTpenLFJfshJok7fPuPkJjUytjbnNg6RYawXFlsx5zWiJFg
 u5NuHnqQRxatcCVxVig==
X-Proofpoint-GUID: 1qE1I7spCx8aZqd5Vmuk6mi_qWyKUctm
X-Proofpoint-ORIG-GUID: 1qE1I7spCx8aZqd5Vmuk6mi_qWyKUctm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX9kJTxk+X9Gkr
 WZ117mCQ/dVv4Ai3+6SSzZrMz2DnS7Sy/Y3gyG/b35BK2Vy87MdPMPtK9CDRek1MiG3Y9tN21GX
 8qNMCRiu3J1GJoMwlrRjolirADWuhhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

> >> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> >> Usually DT binding filenames are aligned with the compatible string for clarity.
> >> Is there a reason for the naming mismatch?
> > The filename reflects the controller; the compatible is
> > variant-specific. This follows the same convention as
> > qcom,lpass-cpu.yaml.
> >>
>
> There is no compatible for controller and the only top-level compatible
> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>
> And I already asked about this in v1. Why does this have to be repeated
> at v3?
The QAIF hardware IP is the same across platforms, only the board
integration details differ. The binding is meant to describe the IP
generically, with board-specific compatibles like qcom,shikra-qaif-cpu
used to distinguish variants. I had qcom,qaif-cpu as the generic
compatible in v2 but removed it in v3 as I was not clear about the
guideline. Could you please suggest the right approach for the
compatible and filename in this case?
>
> What about other comments from v1? Where they implemented?
v3 carries major changes in binding and code, which addresses all the
previous comments from all patches of v1 & v2. Requesting you to
please review v3.
-Harendra
>
> Best regards,
> Krzysztof
