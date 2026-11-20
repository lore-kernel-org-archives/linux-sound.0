Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173108;
	b=WtgR5jYxmZl65sgaVFWOrCIqCMMtjEkxRZbukK0RKxzEoPEAD/BdISUJlU+VQbbqOzeP
	 8In7YgHYOaQNFOulSnU0Q+c6fACKqKvJ4GF6UtU7MyMoaHXZUyvGJTUN3HhHIuExZufYZ
	 xcaF+ZUXB4Yp458S4+wKxOjMxWsPJ5ay+TlBAP8K4Udirf4u8qBG7hHcaMH5TfhI0Cuc6
	 r2gHVX+YYJU27bqNiFN1W5bzNvNdwjIWrMYjFsRcIYLsIJzqjv7zde13zr35Ef+R/JmvQ
	 Ies6nc6eLb1WpjWuSR/ldWQsHsrY7i4xksWBY5PZcSAciWpDxO3uR7za18+mfF8ftDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
	b=gK7wki4Gq3Yz/A0+Gygdgu6ggNaHE1N3ufl+EHR23JxrNNO/hU38MX/cRF3MnsooIaBG
	 LUdsMSORVpETiGa0+6R2pTG5MpMLa78Rldir+3rc8Jy661fVOC1sxtcDOj+Z57PweNrrN
	 zuX+j+zrM9YHMRrTbfebxBtrGwYUzPjzApF3TJsV8vbjBtMPE4fC+awANGxU9OoVe4c/+
	 8VQNsZ+z1Dke4OVqYlJ00cwRAetsIrafRbYPEyXq7reQk9gK6FiqjSp6OkhmCr896bXrp
	 TxcD2KQTviNBByjwJPaopMYrt6F2FhI4chJ/jHojLaWeQii78XbtOrpl8TPbKa3YeOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Z/+yz/TJ";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0260A6F57
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA0260A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z/+yz/TJ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso6886115e9.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173106; x=1795777906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
        b=Z/+yz/TJ5gx/uHkjvZJLarmDD8W0E/mAgswzMMnNQ3pwYvTSZSz7Wn6bpzfoDZEuxy
         QVfmltBcAIY7NCURjeQRLiUVhXT7FgOtDElyVn16ILko8YhTFGsMsyF2FGMOotjjXwAj
         xMYE0664AWZNF16A+lyWbSsyQJ+4vb02tL4htVqOq0kuN3ci7WXxPIcZAIJwaTtsnqzJ
         sJ+EehAJV//OfqAXjhTSK456H1CMeEyNTxrBEI37erZAEWq5j+kiOzFEkC5AMjvLBUPD
         YI9fSdWcGmzHXIAaHYbZhnO0/0bZZMY/lAWCVq5U81qVE/wqTpGLCKw5VEcA30mAkGwv
         p0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173106; x=1795777906;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
        b=gHSTsNsx+uP0ef/1sWpvi5WVnrUKcneDqK9Xc3O35aSM9Qov7mFNqcitbQ7oAm4zu7
         BqjOLkfY9sflh78DLjAV8s1zQVMaX5uNiIWQGJ358yEeCtmVn3SrJOjTC4h4eg07VGFp
         5s97FU9zlWehF+XwPNbSir3jic8AVTW7ruZe3gj+2e8sUln4Wq+oZXHSEAonf6+dbnLL
         brKrY0Hrn+Bgq1ET9B2vJXQ36o7UEvJuW1lglTowPV2xqt0RWZVkJeCjRn6rwdT2w0h7
         cs+AFy19W9wPk+FaRpnRE66iixJDUO2yO7cIhClUj4/1VBddZl7JZU5eBIXJXga7OFhS
         6uHQ==
X-Forwarded-Encrypted: i=1; AL+hErHF2e4CQysRMCc1EPSQggQLkUzcSmgM/lPND+cbRyOgBgVBn5W9i6Xovg3Q/5H0mKh4qlYZVcrLJN2Yng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JihG3c6lgUBKJwqCdBEOo12rUd/eyhVToAPkfHf/gjc/r9khI
	udm2jwYZQeDtMoUqnlcchbyYDgDNVB6LqzUPMUOu34c/Wp4B+p+X1Y9lbDlE48hR/h4=
X-Gm-Gg: AYBFou1IAgNjNkkoeUaliqkbgdCPwWS6vpZufaxGp5x6zDsKyojIOBNZvSd3LrbnWfb
	+azq9vHzBqlnEJMEtzXluZDPmujaK/K6X01H55TnngOfW83vukeZgXxMQzScnOc4LRY4tvWNVaZ
	xhKDld6WvH8lR++wGvS/l2hJVgUlMP9dTeW1pM1Xbcg93A3F0M7WkYE32UFVOUon2hZ6jwdFbms
	MpzTjFvMIaKYBps4/nY0EsMtOt5dZGpun6mzHWXd0tTpPqyK+KaCZtJpit7ODdQfEgqMIlIRmV4
	HW3kHt7n0b2XHGrGncQUzlzTL7cJjxucYqQ3feH5Z11dyyfQmzWB7Ma9iDKGiWQ+tXQDS9wPWg2
	iUqBLVl2TWI6c7jmDeUzPCEiADXVLX47PqSD9jKlOW1UrUrh6bIuXNV/6jq9sMK8fb45MrgZ7w3
	2l/i8GZfBLR2P3sZkeUi4WjmGUak9omSzSyDrEkpXPcRlyTIlvafe1FrEe1GpKxbg9Utv1UYk/l
	B+7VPz2Uxo2gRaWFHRiHocAQUOjnOiemz7TqLDa78amAQXbQCibN/OsW6yDr0DJDGaq9IkShjhI
	SndfcyzBT2Z3rRcJgtX8OZ7W6TpQQagsyxA+G94tMpa+Yy5dzZ9QJutnghDAdxoGdbudvGBmHNL
	YOPpVB5j10sodF4ty
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr66297285e9.9.1795173105614;
        Fri, 20 Nov 2026 03:11:45 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a15absm67903925e9.9.2026.11.20.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 09/10] slimbus: qcom-ngd-ctrl: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:10 +0100
Message-ID:  <73098a91d24bd8e2c27ee4de81aef7a215ab538f.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bKCrn8vViXTu0oRlxufm/tfBP+e4swrbdxcQ4l2ZgRo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrdvLhzTzaMKwmKnBXhF0uK0DkOtNVzco9fG yM02k33F1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq3QAKCRCPgPtYfRL+ TniQCACDWbt5o9mgMSvrlUKqiqBaTVs/F+dfkkTAAv/ojdKir3ePdcwWOewFi7fwlSENK4UuK20 QRSJ0IZiKzy+DoENmo6F9pgy+tGFYAHT+p20bUom8ZEvGdksgkHZTLJM/WjP1vm9xsN3u/9C0FD Evc6HmbZovSEcyAA+wULCRVDEZgj4TIq4SZQYGtssF9KljfUwcNtrN62Dfw6uFOvOjkShZq0PSk tt9623PDRiQ4WcJjQc2vraz+jzX12aPKsCBssCdDaT/PNW3iqHEpUmmx/BrbE7KCwq7/mHJ3a+4 bXnSEzWrxBEQw/3c5i1BpaQARrYR4JXfTdh5TA3SV/fUfXvZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver is expected to be bound to devices using a driver
override---see the respective use of device_set_driver_override()---and
so should be allowed to match via that mechanism.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 8da75c4b50e5..f501740fa4a6 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1837,6 +1837,7 @@ static struct platform_driver qcom_slim_ngd_driver = {
 	.driver	= {
 		.name = QCOM_SLIM_NGD_DRV_NAME,
 		.pm = &qcom_slim_ngd_dev_pm_ops,
+		.support_driver_override = true,
 	},
 };
 
-- 
2.56.0.rc1

