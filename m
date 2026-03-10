Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AA823DD
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101238; cv=none; b=Ea9GB4magMbLBgdBMbrt7S6erjCxVH61EbCzX31BbFsqlnHMnGuH17cnZ9iFgg4VU3jhCKSwft5gcCFMI3hqrc4Bxte+G18kXvVCwrSwLGubZBGzSA/02AYMM1xRmDRqnpTG2uKOkeIrymcCAwiwmGybCh8na0d4gehVRtWfCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101238; c=relaxed/simple;
	bh=3F2v7hgwZr3ASkPIOrKgTyGTogdHVehCHM7L3OoGrn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teglAe9Wz41qnJnFsfdyqZ26Hdk2s/ECfo0FU5ZGKE94OoKzbiUim3q+Yw7RxrrRQ5mrNLivHI569XX+9v84htMZrhrDMfBTZbb4rlsJqhXBXlEmzt9ajlC3QJ3aWgtB2E4ctz3PF9pg7JYqb4YF3E0LBsClhhfbWH56q0QYRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omrl9Z5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikKJxlPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omrl9Z5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikKJxlPl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFnvA2872736
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wz0pGWQvcqBNbODzMfkbDFxp
	ojP6Pl8+dAJsLfprVW8=; b=Omrl9Z5y0ASn3p9OZgFd6Um46iUkDyJfKRJLJrlp
	SUxeV6VpjDLDoud8YjQWNEYro+I8Xya2uzDaAoWxRN3cVSUA+BIXWS2n1oPkJi1+
	eIfJX9nm8r+pNyAGPiW0UFyJD2JTLrAZBvRf35OwlA3NhKJoWoDjuUIA3SLLVV/D
	/YvZDmTfm3KgU3ATSPv736RNw2onpNNqv6Kd3vgbjBEkTlt0SgvPJxQvplqq98wD
	Vl0srS7Ut0qzYbPHAMnKGwUQzyvBrwizfdX/Ov/7i3BABT3kTETBfpg0xWJc7qFb
	DOzqKzQjwLhABBbAF5xt/X4TrIkDbf/zf/UNCBB8X0w49Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gqwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:07:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so993230785a.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101235; x=1773706035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=ikKJxlPlrhtPKkQmSTCiYYjq0xOyBOouL2ZzliW2aCeWJhWk/k8upUnw3TpLUb0B7g
         LajC9SNU1fjZL/GIwH87xulYTddmVCpvp1ulhX95sJnVakZk/xRUFHQG4mOwuFF49T6+
         waTGMd+/i005kzKSgX+7gCzG7NaChxA7J4YA6HU9qd2jZU2UQvq2TTOkhAVmDMAhp3gO
         R8f1VaqN/CFegrjbK1Nc34saQQ/UzqmaVDrJn8JhJ6apY6QATYpjw5eIAGnHJhdlCjDe
         xQ+faJp+/QjcjBZkyw1bOTh+vZszjw07laS8jlC9jx91E7cIeb/YsA7vhvkSqgPrSPXQ
         ys6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101235; x=1773706035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=g+3L4LxK4OoSv/2Cfbnwzi6DBDsjHjKsx5NWEPXFn3TVUVrG+5urFnEbpD6hAXHA5H
         3NWnig6/DuScaNYZQ3j14oGGxe8g+Minq5YUbiwvJZe4IYTYEkFtOVuTGUKx5WRV/Pe2
         b+UboAZVQoZdl3Bt0d1x+nToVhq+Cl/qrNRXo3Gb8yILJx3wSDP0evsFJOqqkF/eRe6F
         b1+XGJ+qA/XLP2H1na6/ZwwvPqrbJQ+oFDnmTKu7lBmf2+/7KroL7WuIhgRtJThKvZP/
         rXK6XXUmC8otQ3DT/zi0UEcOK6TYUEzRvFRyVyQGDO/UE2kxiVsab1+/taAB+98PAV+j
         FEDg==
X-Forwarded-Encrypted: i=1; AJvYcCUN77Yp5la4sUlCJr6N0czvirgnvqJC/3dtBn1BpdRqSgT0mYUlsh/XkCD63I7lyMgzkV3Qxvvfm9ms6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyM7JbExpTW1W7hSH4sZyMSscBlGn2MPaToG8OTpM9PgYteYtj
	e+5b+bavQ8x2wqx/iCvk0ixCVW22qzdWzFTLqREqzRag1PTkoAjAOdBj75ev7mU1IgTecOTWeeZ
	Jble9OmAhm06bqyUKJ7YoYf2UyVj1kd2mS44XHpp/Ui6zrYO+KuLg0DxAFl/sl5Ldfw==
X-Gm-Gg: ATEYQzzySk0/dv+AbVB2F7zlm4OcvuBPW+VDw4qLiWPpdKgUR43JurJY8ymKStfdbS6
	/TFibMKRi6hgIaPmNP2dmrJMIjDIH1SOi62Uel9KzH/2sPvJNzicI6UV84108+MWYcX9o7RXDgh
	gGKgUgz0cLhDVvDRGSO8dk7aBFkaVoH4AUc1oF4UL/DbSrzA8JW9pzwSec4PXwl3TGZLRpoERs/
	mLEkv3OHnlJN+ypNPMjkLX8Vi3Gl5kbiG23qxsuyJ3g2L8S2N/Tf4953nW+jlo8xNrM0ndQ/O1a
	UAMVqBtDaMCySubtWjZyidO6xu6//U2+Fql31UhqT35cBVyxJJPc20HB1KAbm+2Amt61zJkp7eL
	H2sL2qlvFopt+0NYd1PMG/nMoY8neQ5Kuy+2PgS/ezBLWY2ngyFxwtSX3jLB6BJ5cXBmqV+C44/
	8znXgLuCYga4dr+cRnpCKf0Zz+9/tek1ou18g=
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384674885a.33.1773101235233;
        Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384669785a.33.1773101234727;
        Mon, 09 Mar 2026 17:07:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1459sm1844501fa.1.2026.03.09.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: Re: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <ljv2kfghtbnghu4ihfskli7zhiwme2owzvtuwckbbtkcmhuyel@pa2cmlpz73th>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXzO7mnPArJxWs
 NN2OKnQdY1gqunnmcu7Q+T4FpHgNSSiJ0UR2bpthLS1aQp2EHkxjT9PNRhbIVw0C11wn0t+zKfZ
 0BKGuku7aidIxhX5Ikp67ZHlQXxirdcCHyQixk+i8ZEeHsq8F7x4hsDBNNfbxoG5PvSmLIYGgu/
 kM+pIZ8Alp8/cCo5CbPatwYYw/W07wUwW4o918bydtlYY5asfeBooO3JHXH+85CAij6uU0Chjf/
 olXKqz0f7BM6mVwgfjKep/FeUYyvU8uAVpvCd0tdyPXXQg26q88cXCcK/hOpTyOs+onqgbi7Nu/
 WtizGMgRvpxQnq2OVnwcuGpeI6TddA73rpeBpWxy3SrAOUrHaD9UjmHfOxrPLK/AxzD1Zqx+Au/
 jBh0nIq306GJtqQdRgeoKPGJxh6Q6bNIrOrhGZrTgoxmodJA8XWt6N5u4I49Y2Jexo/zM6DsXYl
 2JvNkTBPQJALmqeJuEQ==
X-Proofpoint-GUID: xgHR4WycnTEAjmpq2Yy56kjTsOFAfo41
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af60b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=R1rXswN30TRtGkWU7PEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xgHR4WycnTEAjmpq2Yy56kjTsOFAfo41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:36AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c  | 2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
