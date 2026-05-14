Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622DC315D46
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773876; cv=none; b=deA00SzVcRYjs57PXYRZ1pJKiwJtn5mNXxuWtADyStBUXMAUjh4pwzM+hXsJiX+7J26TP+TEbe1mDONhsOY3Ofkz1qbNRNaQj4xc953x1Hff0wckb8b2dNNL4mLLK6FO4po8LTQaR1TBW6QbXpgUg89fajAojm/QW1dOwFDMe1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773876; c=relaxed/simple;
	bh=sw65wg/gLObwIYJeE44DoHEjbavZZQqBt5qYGDc9Jx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVGy64Sr3IKTqceRcFKOwXXb6EtdVZgXn9/naGlypgsRY5uxXAG/wwXkkK2Mbjp+KAm6SBLeFohZpJcRP29y87T/eI80gS+sPJBBn3slEItUq7Cx1QJT/3l3v1vFySpUhElrJSNm6kvcR1WfXWpUJiZJKegvljZcgIldsr3/PY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSrGnd1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSjNzVxy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSrGnd1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSjNzVxy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQqh3890898
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LLMRt9m1xYG
	D32un0pFlcXHxQno0LK7UKUpMQvEbLio=; b=XSrGnd1cg37Dy8h6AmTPM4EGd7g
	9YdEPvKat6xdhYCQVJYGfSTsYiiaX1gjPUqdZfcC9KexRqjgSr45OodTaEjjxfd/
	LXyF2Q3yXW2tIpqJEuLvxMBr6Ht4vuvlom3XW4Vu9fa81EzTEPCSK08mWYCXeWGp
	BI7u3p0p1E6sSjJaStnI/T66zD84Y1aYgd9M8OXXCaI45DT4EHY9KIHRGgvJdt0A
	0NFa1WjqWwMa1D3f3d8ZnU8fopd82zbc/Ygcz4wmSyBflQSAUrzyM1K93Mfh1Vbt
	iHGWmkO4wLhvfniZrTLlLscGXxpJhUitLA8k1S/0Oe1lk2OKLrgYMbNYfwg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tvr3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so3526281241.1
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773865; x=1779378665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLMRt9m1xYGD32un0pFlcXHxQno0LK7UKUpMQvEbLio=;
        b=eSjNzVxyD1aOEeZlbQtEVrOPaN6KPvPYFJkL/Hfplc7+dIqUZmBoDtlZYLLEqTHo+u
         SMlRWNC56PeWS5Lxz/Y+yPtEt5Q3JDEax7Z6j3SGEd5s+jNl/YeXL1UiBRZaa/xHhYjZ
         jQBfVgYbzgnanvAiKfoJ/5wA2ciAEXNhVwlceo8VXnmou8sxdeNZFq7iR9yqbqW0W6SM
         qKPh4GZoh9SNVSBlhJcSpG8npauMs6XxTbdZy7LgKgC9LEZwx44ZovxCLgr42TQywKvM
         PvN3la/pmV3YqZYOheXNBTGMqhXEi+VPotqC3P4rLJdaoAbb2kkIyEoaYg1TE2aeiLiG
         BPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773865; x=1779378665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLMRt9m1xYGD32un0pFlcXHxQno0LK7UKUpMQvEbLio=;
        b=PdSVtEjGeABI7xuf6SHgcPMazyNXtK51469DoegK8NNwdibVaZsvy7I72eS0Uyiw0U
         M27UfcKYe+k0C2RHLFKKiLH2UV/6MSBgB1qRyF5YxRe4stwv/pORogYfOowV1uB+ldXr
         +SOGeCZ6+rqItGmgNs28LMxQBAwncyFSMo/yFiDL8gQhfbTQdQpssPp0ZEyA1QQCQ8Ji
         gbaOf5HyYTlaz4dJOWFHgNzByxTOdh8BZlroK5m82wLl52Zi8gdPkztHR2zaU0XFVNNa
         u89mERKaXbcUOq8M4b3qB2gwfWwyzaqt9rOVHRWkZ9ZBOr5mOmRCtGmN0L8q1e6LuBsC
         cEaA==
X-Forwarded-Encrypted: i=1; AFNElJ8O5cJw1y/Ib8ya4FQqZKM3V1yuhMTceWYxAZbZluQjz+pT8D/YLIDr5z796r3jZYpSaH41vo9GCy2oag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB7JIgQ4dm40Mp1W2w9d1Qc4zkzCWi8t2axulsc5jk1eKz7bWP
	d5hgHh1i+NNaJ/9KBQVNKBk93AyDTi3nPBwh+PqRyQsHRa1euc/hqQK3nrBcPByEl5+zqzyNXtz
	8F4x+pOUEYYBZqah6bR32/3E2+cSz7OxJeoiDkPs1ciVdVOqEYT2tf37iRbGlBHNFVw==
X-Gm-Gg: Acq92OFjmSVv/pwiCc9iLAqL6XfGHEU+eQwIOumaP/gBpEkISXqb9NaT7pIOCvUaE0r
	NTdkvwa5rMN69w0W11wVt3yoiSRHzCY5dDZdAOJ4jJDkWC0cBs121D+D9snouRVrfp72jThCAvf
	7e2pGPwxzoAcRh/x1VM8QAxJ5FIiFkXl7P+8nv0MXIssYHEtZ8jV2O0EWEL5MDAbfoWWtN5C0qL
	f7lMl4ZlxgfqJFfSv9WnWKS2Q6CxHMq5vwPM2GaKXjLG7cR7MjmFYGtrqOMvjWvOytBQxgvW9Jc
	7ZpCDfsC52jYmeYBS+WLLme3zSrNl4QhF5oz3hwPRh4oG4L0Qua0aq0n1OsKnSPx+B924gJWXKJ
	GpzvmPucLRsDW8EK8d0N0UDwbU2iEWJYX+sewD9Nv4CBrxZV1Nd9u6JQ=
X-Received: by 2002:a05:6102:605c:b0:604:f849:462e with SMTP id ada2fe7eead31-63774129752mr3880612137.25.1778773864431;
        Thu, 14 May 2026 08:51:04 -0700 (PDT)
X-Received: by 2002:a05:6102:605c:b0:604:f849:462e with SMTP id ada2fe7eead31-63774129752mr3880558137.25.1778773863721;
        Thu, 14 May 2026 08:51:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:51:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] soc: qcom: apr: Process RX messages using per-service work items
Date: Thu, 14 May 2026 15:50:51 +0000
Message-ID: <20260514155051.2593354-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05ef69 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Myf5NQMlE0kz4Lw5rJwA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfX6nBUEtjNAbk0
 JEr8LxaRJ0pa/R3fvpzMBFfrk6PJHAzImzMTcd4mRi7QaP6I+35SAKMZh6xPrfSW2bbBHbJW2zO
 fRIa6RYLsyYyWd9NdcKHiB/c3prkZNREf+yyxYOZMKMX0nquwjG+UP9RHyNwjnMm+Iai2oPcwx/
 vRnJ7v1flGhw06rFGb/S3WRVG88zJgjAs13Dz4VKqhtHcOt8Nm6ota4cA8wuGwq87SINfRzoS9D
 jk1VoWP7IJSMk4GpYrX1s5Z1RRnoATdNYnu0wLS8fXaAb51hn63SB9c8ODEo7HbmFs9SzkLYg79
 YVZrjKM0nI+hJ3wbrLKOM7SzAM0ZxgJUBoWRUQVJ8BLCo/zPE1D7y1WFRlH6g9TxjxxJassDHNV
 XIJRIWmVCNlr1zdPA2JAK4ZfxId7j/h/xyBR8JrCdn/o8vzl25TSbJnIOz4VtqBZgDZ9o1OLgCS
 x/zP7N00xbccNLuO+7A==
X-Proofpoint-ORIG-GUID: 310s__-qAzIzdX7G3E4wxvbOIJg7a9Ou
X-Proofpoint-GUID: 310s__-qAzIzdX7G3E4wxvbOIJg7a9Ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160

The APR transport currently serializes all incoming packets through a
single work item and a global RX queue. If one service callback blocks
or takes a long time to complete, packet processing for all other
services is delayed.

Move RX buffering and work items from the packet router to each
individual service. Incoming packets are queued on a per-service list
and processed by that service's work item, allowing unrelated services
to make progress independently while preserving message ordering within
each service.

Since queued packets may outlive service removal, add a reference count
to keep the service object alive until all queued packets have been
processed, and reject new packets once the service begins shutting down.

Switch the shared APR workqueue to an unbound reclaim workqueue so that
multiple services can process packets in parallel.

This also addresses the random CMD timeouts seen with audio commands
that are sent to DSP which timeout on the response as they are waiting in
the queue for other commands to finish.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c       | 265 +++++++++++++++++++++++------------
 include/linux/soc/qcom/apr.h |   6 +
 2 files changed, 185 insertions(+), 86 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 68b357462438..f25219b48cdc 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -28,14 +28,11 @@ struct packet_router {
 	struct rpmsg_endpoint *ch;
 	struct device *dev;
 	spinlock_t svcs_lock;
-	spinlock_t rx_lock;
 	struct idr svcs_idr;
 	int dest_domain_id;
 	int type;
 	struct pdr_handle *pdr;
 	struct workqueue_struct *rxwq;
-	struct work_struct rx_work;
-	struct list_head rx_list;
 };
 
 struct apr_rx_buf {
@@ -74,54 +71,58 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt)
 }
 EXPORT_SYMBOL_GPL(apr_send_pkt);
 
-void gpr_free_port(gpr_port_t *port)
+static void apr_svc_release(struct kref *ref)
 {
-	struct packet_router *gpr = port->pr;
-	unsigned long flags;
+	struct pkt_router_svc *svc;
 
-	spin_lock_irqsave(&gpr->svcs_lock, flags);
-	idr_remove(&gpr->svcs_idr, port->id);
-	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+	svc = container_of(ref, struct pkt_router_svc, refcount);
 
-	kfree(port);
+	if (svc->dynamic_svc)
+		kfree(svc);
 }
-EXPORT_SYMBOL_GPL(gpr_free_port);
 
-gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
-				gpr_port_cb cb,	void *priv)
+static void apr_svc_get(struct pkt_router_svc *svc)
 {
-	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
-	gpr_port_t *port;
-	struct pkt_router_svc *svc;
-	int id;
+	kref_get(&svc->refcount);
+}
 
-	port = kzalloc_obj(*port);
-	if (!port)
-		return ERR_PTR(-ENOMEM);
+static void apr_svc_put(struct pkt_router_svc *svc)
+{
+	kref_put(&svc->refcount, apr_svc_release);
+}
 
-	svc = port;
-	svc->callback = cb;
-	svc->pr = pr;
-	svc->priv = priv;
-	svc->dev = dev;
-	spin_lock_init(&svc->lock);
+static void apr_svc_purge_rx(struct pkt_router_svc *svc)
+{
+	struct apr_rx_buf *abuf, *tmp;
+	unsigned long flags;
 
-	spin_lock(&pr->svcs_lock);
-	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
-			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
-	if (id < 0) {
-		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
-		kfree(port);
-		spin_unlock(&pr->svcs_lock);
-		return ERR_PTR(id);
+	spin_lock_irqsave(&svc->lock, flags);
+	list_for_each_entry_safe(abuf, tmp, &svc->rx_list, node) {
+		list_del(&abuf->node);
+		kfree(abuf);
+		apr_svc_put(svc);
 	}
+	spin_unlock_irqrestore(&svc->lock, flags);
+}
 
-	svc->id = id;
-	spin_unlock(&pr->svcs_lock);
+void gpr_free_port(gpr_port_t *port)
+{
+	struct packet_router *gpr = port->pr;
+	unsigned long flags;
 
-	return port;
+	spin_lock_irqsave(&port->lock, flags);
+	port->dying = true;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	spin_lock_irqsave(&gpr->svcs_lock, flags);
+	idr_remove(&gpr->svcs_idr, port->id);
+	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+
+	cancel_work_sync(&port->rx_work);
+	apr_svc_purge_rx(port);
+	apr_svc_put(port);
 }
-EXPORT_SYMBOL_GPL(gpr_alloc_port);
+EXPORT_SYMBOL_GPL(gpr_free_port);
 
 static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
@@ -155,15 +156,53 @@ static void apr_dev_release(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
 
+	cancel_work_sync(&adev->svc.rx_work);
+	apr_svc_purge_rx(&adev->svc);
+	apr_svc_put(&adev->svc);
 	kfree(adev);
 }
 
+static struct pkt_router_svc *apr_find_svc(struct packet_router *apr, void *buf)
+{
+	struct pkt_router_svc *svc;
+	unsigned long flags;
+	uint32_t svc_id;
+	struct apr_hdr *ahdr;
+	struct gpr_hdr *ghdr;
+
+	switch (apr->type) {
+	case PR_TYPE_APR:
+		ahdr = buf;
+		svc_id = ahdr->dest_svc;
+		break;
+	case PR_TYPE_GPR:
+		ghdr = buf;
+		svc_id = ghdr->dest_port;
+		break;
+	default:
+		dev_err(apr->dev, "Invalid Packet Router\n");
+		return NULL;
+	}
+
+	spin_lock_irqsave(&apr->svcs_lock, flags);
+	svc = idr_find(&apr->svcs_idr, svc_id);
+	if (svc)
+		apr_svc_get(svc);
+	spin_unlock_irqrestore(&apr->svcs_lock, flags);
+
+	if (!svc)
+		dev_err(apr->dev, "APR: service is not registered (%d)\n", svc_id);
+
+	return svc;
+}
+
 static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 				  int len, void *priv, u32 addr)
 {
 	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 	struct apr_rx_buf *abuf;
 	unsigned long flags;
+	struct pkt_router_svc *svc;
 
 	switch (apr->type) {
 	case PR_TYPE_APR:
@@ -189,24 +228,35 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	abuf->len = len;
 	memcpy(abuf->buf, buf, len);
 
-	spin_lock_irqsave(&apr->rx_lock, flags);
-	list_add_tail(&abuf->node, &apr->rx_list);
-	spin_unlock_irqrestore(&apr->rx_lock, flags);
+	svc = apr_find_svc(apr, buf);
+	if (!svc) {
+		kfree(abuf);
+		return 0;
+	}
+
+	spin_lock_irqsave(&svc->lock, flags);
+	if (svc->dying) {
+		spin_unlock_irqrestore(&svc->lock, flags);
+		kfree(abuf);
+		apr_svc_put(svc);
+		return 0;
+	}
+
+	list_add_tail(&abuf->node, &svc->rx_list);
+	spin_unlock_irqrestore(&svc->lock, flags);
 
-	queue_work(apr->rxwq, &apr->rx_work);
+	queue_work(apr->rxwq, &svc->rx_work);
 
 	return 0;
 }
 
-static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf)
+static int apr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
 {
-	uint16_t hdr_size, msg_type, ver, svc_id;
-	struct pkt_router_svc *svc;
-	struct apr_device *adev;
+	uint16_t hdr_size, msg_type, ver;
+	struct apr_device *adev = NULL;
 	struct apr_driver *adrv = NULL;
 	struct apr_resp_pkt resp;
 	struct apr_hdr *hdr;
-	unsigned long flags;
 	void *buf = abuf->buf;
 	int len = abuf->len;
 
@@ -217,18 +267,18 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 
 	hdr_size = APR_HDR_FIELD_SIZE_BYTES(hdr->hdr_field);
 	if (hdr_size < APR_HDR_SIZE) {
-		dev_err(apr->dev, "APR: Wrong hdr size:%d\n", hdr_size);
+		dev_err(svc->dev, "APR: Wrong hdr size:%d\n", hdr_size);
 		return -EINVAL;
 	}
 
 	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
-		dev_err(apr->dev, "APR: Wrong packet size\n");
+		dev_err(svc->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
 
 	msg_type = APR_HDR_FIELD_MT(hdr->hdr_field);
 	if (msg_type >= APR_MSG_TYPE_MAX) {
-		dev_err(apr->dev, "APR: Wrong message type: %d\n", msg_type);
+		dev_err(svc->dev, "APR: Wrong message type: %d\n", msg_type);
 		return -EINVAL;
 	}
 
@@ -236,22 +286,17 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 			hdr->dest_domain >= APR_DOMAIN_MAX ||
 			hdr->src_svc >= APR_SVC_MAX ||
 			hdr->dest_svc >= APR_SVC_MAX) {
-		dev_err(apr->dev, "APR: Wrong APR header\n");
+		dev_err(svc->dev, "APR: Wrong APR header\n");
 		return -EINVAL;
 	}
 
-	svc_id = hdr->dest_svc;
-	spin_lock_irqsave(&apr->svcs_lock, flags);
-	svc = idr_find(&apr->svcs_idr, svc_id);
 	if (svc && svc->dev->driver) {
 		adev = svc_to_apr_device(svc);
 		adrv = to_apr_driver(adev->dev.driver);
 	}
-	spin_unlock_irqrestore(&apr->svcs_lock, flags);
 
 	if (!adrv || !adev) {
-		dev_err(apr->dev, "APR: service is not registered (%d)\n",
-			svc_id);
+		dev_err(svc->dev, "APR: service device not found\n");
 		return -EINVAL;
 	}
 
@@ -270,13 +315,11 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 	return 0;
 }
 
-static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
+static int gpr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
 {
 	uint16_t hdr_size, ver;
-	struct pkt_router_svc *svc = NULL;
 	struct gpr_resp_pkt resp;
 	struct gpr_hdr *hdr;
-	unsigned long flags;
 	void *buf = abuf->buf;
 	int len = abuf->len;
 
@@ -287,12 +330,12 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 
 	hdr_size = hdr->hdr_size;
 	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
-		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
+		dev_err(svc->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
 		return -EINVAL;
 	}
 
 	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
-		dev_err(gpr->dev, "GPR: Wrong packet size\n");
+		dev_err(svc->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
 
@@ -306,49 +349,91 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 	if (resp.payload_size > 0)
 		resp.payload = buf + (hdr_size *  4);
 
-
-	spin_lock_irqsave(&gpr->svcs_lock, flags);
-	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
-	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
-
-	if (!svc) {
-		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
-			hdr->dest_port);
-		return -EINVAL;
-	}
-
 	if (svc->callback)
 		svc->callback(&resp, svc->priv, 0);
 
 	return 0;
 }
 
-static void apr_rxwq(struct work_struct *work)
+static void apr_service_rxwq(struct work_struct *work)
 {
-	struct packet_router *apr = container_of(work, struct packet_router, rx_work);
+	struct pkt_router_svc *svc = container_of(work, struct pkt_router_svc, rx_work);
+	struct packet_router *apr = svc->pr;
 	struct apr_rx_buf *abuf, *b;
 	unsigned long flags;
 
-	if (!list_empty(&apr->rx_list)) {
-		list_for_each_entry_safe(abuf, b, &apr->rx_list, node) {
+	for (;;) {
+		LIST_HEAD(local);
+
+		spin_lock_irqsave(&svc->lock, flags);
+		if (list_empty(&svc->rx_list)) {
+			spin_unlock_irqrestore(&svc->lock, flags);
+			break;
+		}
+
+		list_splice_init(&svc->rx_list, &local);
+		spin_unlock_irqrestore(&svc->lock, flags);
+
+		list_for_each_entry_safe(abuf, b, &local, node) {
 			switch (apr->type) {
 			case PR_TYPE_APR:
-				apr_do_rx_callback(apr, abuf);
+				apr_do_rx_callback(svc, abuf);
 				break;
 			case PR_TYPE_GPR:
-				gpr_do_rx_callback(apr, abuf);
+				gpr_do_rx_callback(svc, abuf);
 				break;
 			default:
 				break;
 			}
-			spin_lock_irqsave(&apr->rx_lock, flags);
+			apr_svc_put(svc);
 			list_del(&abuf->node);
-			spin_unlock_irqrestore(&apr->rx_lock, flags);
 			kfree(abuf);
 		}
 	}
 }
 
+gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
+				gpr_port_cb cb,	void *priv)
+{
+	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
+	gpr_port_t *port;
+	struct pkt_router_svc *svc;
+	int id;
+
+	port = kzalloc_obj(*port);
+	if (!port)
+		return ERR_PTR(-ENOMEM);
+
+	svc = port;
+	svc->callback = cb;
+	svc->pr = pr;
+	svc->priv = priv;
+	svc->dying = false;
+	svc->dynamic_svc = true;
+	svc->dev = dev;
+	spin_lock_init(&svc->lock);
+
+	INIT_WORK(&svc->rx_work, apr_service_rxwq);
+	INIT_LIST_HEAD(&svc->rx_list);
+	kref_init(&svc->refcount);
+
+	spin_lock(&pr->svcs_lock);
+	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
+			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
+	if (id < 0) {
+		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
+		kfree(port);
+		spin_unlock(&pr->svcs_lock);
+		return ERR_PTR(id);
+	}
+
+	svc->id = id;
+	spin_unlock(&pr->svcs_lock);
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(gpr_alloc_port);
+
 static int apr_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct apr_device *adev = to_apr_device(dev);
@@ -390,6 +475,11 @@ static void apr_device_remove(struct device *dev)
 	struct apr_device *adev = to_apr_device(dev);
 	struct apr_driver *adrv = to_apr_driver(dev->driver);
 	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
+	unsigned long flags;
+
+	spin_lock_irqsave(&adev->svc.lock, flags);
+	adev->svc.dying = true;
+	spin_unlock_irqrestore(&adev->svc.lock, flags);
 
 	if (adrv->remove)
 		adrv->remove(adev);
@@ -437,9 +527,15 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	svc->id = svc_id;
 	svc->pr = apr;
 	svc->priv = adev;
+	svc->dying = false;
 	svc->dev = dev;
+	svc->dynamic_svc = false;
 	spin_lock_init(&svc->lock);
 
+	INIT_WORK(&svc->rx_work, apr_service_rxwq);
+	INIT_LIST_HEAD(&svc->rx_list);
+	kref_init(&svc->refcount);
+
 	adev->domain_id = domain_id;
 
 	if (np)
@@ -488,7 +584,6 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		dev_err(dev, "device_register failed: %d\n", ret);
 		put_device(&adev->dev);
 	}
-
 out:
 	return ret;
 }
@@ -629,12 +724,12 @@ static int apr_probe(struct rpmsg_device *rpdev)
 	dev_set_drvdata(dev, apr);
 	apr->ch = rpdev->ept;
 	apr->dev = dev;
-	apr->rxwq = create_singlethread_workqueue("qcom_apr_rx");
+
+	apr->rxwq = alloc_workqueue("qcom_apr_rx", WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	if (!apr->rxwq) {
 		dev_err(apr->dev, "Failed to start Rx WQ\n");
 		return -ENOMEM;
 	}
-	INIT_WORK(&apr->rx_work, apr_rxwq);
 
 	apr->pdr = pdr_handle_alloc(apr_pd_status, apr);
 	if (IS_ERR(apr->pdr)) {
@@ -643,8 +738,6 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		goto destroy_wq;
 	}
 
-	INIT_LIST_HEAD(&apr->rx_list);
-	spin_lock_init(&apr->rx_lock);
 	spin_lock_init(&apr->svcs_lock);
 	idr_init(&apr->svcs_idr);
 
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 58fa1df96347..f5bc55c3d025 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -3,6 +3,7 @@
 #ifndef __QCOM_APR_H_
 #define __QCOM_APR_H_
 
+#include <linux/kref.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -129,6 +130,11 @@ struct pkt_router_svc {
 	gpr_port_cb callback;
 	struct packet_router *pr;
 	spinlock_t lock;
+	struct work_struct rx_work;
+	struct list_head rx_list;
+	struct kref refcount;
+	bool dying;
+	bool dynamic_svc;
 	int id;
 	void *priv;
 };
-- 
2.47.3

