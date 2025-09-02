Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038F2DFF1D
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821665; cv=none; b=O3+gNrVDqu3HzAK+IgRtoSBMwI8sMlNgbMfMn3Sgo1NQoNQeri+ssdcIcePhikFXFSZjg3VhoagPrp2YHfYIo/gYUhqe2ysiFmK5f+iP0HZBrhgosk6lRjPXnN60gQTwOb4SHdR8MbYpwXrM11gjuP3ce2pjrk8nhadF593MR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821665; c=relaxed/simple;
	bh=gEpj7b+o020sV6p7lpCzjnDqFYnfMtxrY4cMk3OFcWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cONylDZLhwjKjy42Ml/fwkknF9QY4jBnMjEEfuOpF+w4fRM7D6PbTIRDcJfCD2VXsyCQc7rngkXhQh/YYuN4+2QJeW2nBLteYnPXi6y8cxtA6oMs4JpJ86BGRZpEAudAZVAuE5RNFGivMjc/9/3SNCk3ZVje+tpcfs+f5237Ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X99/i/cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X99/i/cq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Aowv2017336
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X4nCKgYxQJj
	fMP/VUT4XYH1vbsoebu/W1HveCS5YCMM=; b=X99/i/cqbpVctClptjZ2uSWd9i6
	HSdn+KG6rJ/lqjfyYfA7BUhxLOoc6rVr8UAQ1gvLZF0lZH3zV7cehzfWwkDCenN9
	ErHysU/1djCMU+8n9DMc+jbIFNUiDambxv8Po64dYH6vN8oq7e+fjt/UcxAeuLje
	cjA2FFzgYEsA/DoUYISTtOgz9jtybawo/OI5b01Sa84kkysjIgtt4FZHoUDDbOa1
	ogw+inb+7c56Uc5FiYTtJnVyDYDBNWTNuiwdBnLHZFQQi7Rp5P2N+Te5XYai41TL
	rRxDlEFf33GdxN7YPGtpVSkI8Dl09nOePP4h1znU9f0zKWmiUxcLeUyuOcQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8yuk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:01:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-892458cb161so394116241.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821659; x=1757426459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4nCKgYxQJjfMP/VUT4XYH1vbsoebu/W1HveCS5YCMM=;
        b=dSW80/ZPniLlsw/HqDxO4bPUM0M4Q7z1toDwV4PmQmHuHAmMiszPBjgP41joeADzRA
         DYN5FuZ2cup/FbQyZ3uEnKZIUNPNJ+p7PESWrkVJg0S8NTQMj3EpGnxTRb1IjKxPG2GL
         1VbwkbjrwJtDZcS/3u/IPhEEv63LcTH5JNAQAkwc5zxHuZh1Gtk0lUyrQCakIJIK/+Ch
         iEnTVVBt7tNDxwdU6Hu9jRfwFLwTkDVMcHQy8MBJ6VgpPbZ2H1gdazLlcOrkjs6PvAAn
         W1035TRZ/z5rJVzxXRVkU//S3xbevsl+7iEg1ahoPOlhcPcpgZf2t97RuG6pDmBRVfer
         0+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWhxckSsC/LcZl6LBgrFI/sj0X0ximy1J+9bOoWRSwlh4uwJpURX4mrJcEnWQP7Crgaoz/P6r320VcKWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06eovAyrE68gHXxlRfbWVTznZsX7p2nL7Q2yZ41rxQcG7LdWQ
	c7p3ljDXwYM8TlNEjjBRrIdFdVq79ngBlFhn8sKUWVxIERjqjYGvFT+Xrr7Uf62zQwxegbaKCkz
	1Bvf1HcGjLtFBRRRWOeX8bdiqs+ddIr5Xpsg7M3w+IfFUa7RBwcRMiGrfuYh83EYKpA==
X-Gm-Gg: ASbGncv0q9Vbz3AcPRGeNBwpvngu9oefBaUEWQF9JBIWDzVmmjY56P44Xi2lrTdUw4j
	kj4z+IHC0aOuGBp1H1aM+w9d6rqsk56jGhkbVwZXgyKQ9tsJDwwqT7EEBqY4HzGpeN+vJx4qTbD
	n7eVE5JoAJkuXdjFf1vaCyTafrMBmU7wlfrvhLpZP+X8m4Ycljjkw4mT41c70U2/ecBU405dTnE
	jGxeswJRA6D/k5QQsHk/UV7ttEH6lMVoEN60sWNf8ZptQjoBpya21QWdheAN5uwWJTznYE16YfK
	jZdj5cPdQLXCrNAsIntId1TSD7DOemjcCSTwUInO+ni6txxmx7jljA==
X-Received: by 2002:a05:6102:c07:b0:528:95cd:bdb1 with SMTP id ada2fe7eead31-52b1bd1d838mr3723202137.25.1756821658094;
        Tue, 02 Sep 2025 07:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4njbxVQBDhMgFP+R+/C1mkzBd4r1t0DyPORMMUl9tndSyU436LA4uBfQwkstR2HtckVPx8Q==
X-Received: by 2002:a05:6102:c07:b0:528:95cd:bdb1 with SMTP id ada2fe7eead31-52b1bd1d838mr3723115137.25.1756821657123;
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/6] ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
Date: Tue,  2 Sep 2025 15:00:40 +0100
Message-ID: <20250902140044.54508-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXzef9SHHU56Bk
 +1abVejZprLCF/XiLIyes4dgKvLEQCcdCVxZGxpGKzp34uMID/QkdFc8LczmZIZl2uP+VzDurpf
 /5UiXfX0m3flqZC542SgEz7YXIR0WBGiNYFn56ma5NQHqJPftt5jWbCzQimrpQw8NVqT5Saj7CN
 WpcfbJiQY2ia9heHYi1kp1N1c0ACefHeBZRHS/mGV6InRnPLcszUufzSg2DwY0J/kM2QWO84pqV
 BoeFErw7d7NK+0x97MtmSDkigeev8cCsFq4K5wxcih1gKJc0BFKnqVCoQapfnPd39HpO9IjECa4
 BYKMQAkx2OErezEi1yr
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6f89c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MxEaA3INf6t8ycFtHZsA:9 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: icHK445gihFiU1OCVKihFj_CXtGFOdp2
X-Proofpoint-ORIG-GUID: icHK445gihFiU1OCVKihFj_CXtGFOdp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508300042

Document the bindings for the glymur sound card which is
audioreach based architecture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 5d3dbb6cb1ae..8ac91625dce5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
+          - qcom,glymur-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
-- 
2.50.0

